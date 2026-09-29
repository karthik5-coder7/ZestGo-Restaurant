package com.Food.utility;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

/**
 * Central database access point.
 *
 * PERFORMANCE FIX:
 * Previously every DAO call created a brand new TCP+TLS connection to the
 * remote Aiven MySQL server (hundreds of ms each) and closed it after one
 * query. This class now keeps a small pool of long-lived connections that
 * are reused across requests, so the connection setup cost is paid once
 * at first use instead of on every single query.
 *
 * DAOs keep calling DBConnection.getConnection() and close the connection
 * when done: close() on the returned handle transparently returns the
 * connection to the pool instead of destroying it, so no DAO changes
 * were needed for this speedup.
 */
public class DBConnection {

    private static final Logger LOG =
            Logger.getLogger(DBConnection.class.getName());

    private static final String URL =
            "jdbc:mysql://mysql-51d7552-karthikmodemkondagalla-8c84.k.aivencloud.com:26509/defaultdb"
            + "?sslMode=REQUIRED&serverTimezone=UTC"
            + "&connectTimeout=10000&socketTimeout=30000";

    private static final String USERNAME =
            System.getenv().getOrDefault("DB_USERNAME", "avnadmin");

    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    /*
     * Pool sizing: small by design. This app's traffic is modest and
     * Aiven free tiers cap concurrent connections, so 8 is plenty.
     */
    private static final int POOL_SIZE = 8;

    private static final long BORROW_TIMEOUT_MS = 8000;

    private static final BlockingQueue<Connection> POOL =
            new ArrayBlockingQueue<>(POOL_SIZE);

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOG.severe("MYSQL JDBC DRIVER NOT FOUND: " + e.getMessage());
        }
    }

    private DBConnection() {
        // static utility
    }

    /**
     * Borrows a pooled connection. Callers must close() it when finished
     * (all DAOs already do via try-with-resources or finally blocks) -
     * that close returns the connection to the pool.
     */
    public static Connection getConnection() {

        try {
            Connection pooled = POOL.poll(BORROW_TIMEOUT_MS, TimeUnit.MILLISECONDS);

            if (pooled == null) {
                LOG.warning("DB pool exhausted - using direct connection");
                return wrap(createConnection());
            }

            if (isUsable(pooled)) {
                return wrap(pooled);
            }

            // Stale connection (DB restart / idle timeout): replace it
            closeQuietly(pooled);
            LOG.warning("Stale pooled connection replaced");
            return wrap(createConnection());

        } catch (InterruptedException e) {

            Thread.currentThread().interrupt();

        } catch (SQLException e) {

            LOG.severe("DB connection failed: " + e.getMessage());
            return null;
        }

        // Interrupted while waiting for a pooled connection
        try {
            return wrap(createConnection());
        } catch (SQLException ex) {
            LOG.severe("DB connection failed: " + ex.getMessage());
            return null;
        }
    }

    private static Connection createConnection() throws SQLException {

        if (PASSWORD == null || PASSWORD.isEmpty()) {
            throw new SQLException(
                    "DB_PASSWORD environment variable is missing");
        }

        return java.sql.DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    /**
     * Wraps a real connection so that close() hands it back to the pool.
     * All other calls are delegated unchanged.
     */
    private static Connection wrap(final Connection real) {

        InvocationHandler handler = new InvocationHandler() {

            @Override
            public Object invoke(Object proxy, Method method, Object[] args)
                    throws Throwable {

                String name = method.getName();

                if ("close".equals(name)) {
                    returnConnection(real);
                    return null;
                }

                if ("isClosed".equals(name)) {
                    return Boolean.FALSE;
                }

                try {
                    return method.invoke(real, args);

                } catch (InvocationTargetException e) {
                    Throwable cause = e.getCause();
                    if (cause != null) {
                        throw cause;
                    }
                    throw e;
                }
            }
        };

        return (Connection) Proxy.newProxyInstance(
                DBConnection.class.getClassLoader(),
                new Class<?>[]{ Connection.class },
                handler);
    }

    private static void returnConnection(Connection real) {

        if (isUsable(real) && POOL.offer(real)) {
            return;
        }

        // Broken or pool full: actually close it
        closeQuietly(real);
    }

    private static boolean isUsable(Connection con) {
        try {
            return con != null && con.isValid(2);
        } catch (SQLException e) {
            return false;
        }
    }

    private static void closeQuietly(Connection con) {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException ignored) {
            // connection already broken
        }
    }
}
