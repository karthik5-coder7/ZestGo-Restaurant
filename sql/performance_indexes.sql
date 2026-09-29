-- ============================================================
-- ZestGo performance indexes (idempotent - safe to re-run)
-- Run once against the Aiven MySQL database via the Aiven
-- console or a mysql client. Re-running does nothing if the
-- indexes already exist.
-- ============================================================

DELIMITER $$

DROP PROCEDURE IF EXISTS zestgo_add_index_if_missing $$

CREATE PROCEDURE zestgo_add_index_if_missing()
BEGIN

    -- Login / register lookups (every login does WHERE email=?)
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'register'
          AND index_name = 'idx_register_email'
    ) THEN
        ALTER TABLE register ADD INDEX idx_register_email (email);
    END IF;

    -- Restaurant list / search on name
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'food_app'
          AND index_name = 'idx_food_app_name'
    ) THEN
        ALTER TABLE food_app ADD INDEX idx_food_app_name (name);
    END IF;

    -- Menu page: WHERE RestaurantID=?
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'menu'
          AND index_name = 'idx_menu_restaurant'
    ) THEN
        ALTER TABLE menu ADD INDEX idx_menu_restaurant (RestaurantID);
    END IF;

    -- Search across dishes on ItemName
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'menu'
          AND index_name = 'idx_menu_item_name'
    ) THEN
        ALTER TABLE menu ADD INDEX idx_menu_item_name (ItemName);
    END IF;

    -- Favorites join: WHERE userName=? AND restaurantId=?
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'favorites'
          AND index_name = 'idx_favorites_user_restaurant'
    ) THEN
        ALTER TABLE favorites
            ADD INDEX idx_favorites_user_restaurant (userName, restaurantId);
    END IF;

    -- Order history: WHERE email=? AND isDeleted=0 ORDER BY orderDate DESC
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'orders'
          AND index_name = 'idx_orders_email_deleted_date'
    ) THEN
        ALTER TABLE orders
            ADD INDEX idx_orders_email_deleted_date (email, isDeleted, orderDate);
    END IF;

    -- Order items join: WHERE orderId IN (...)
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name = 'orders_items'
          AND index_name = 'idx_orders_items_order'
    ) THEN
        ALTER TABLE orders_items ADD INDEX idx_orders_items_order (orderId);
    END IF;

END $$

DELIMITER ;

CALL zestgo_add_index_if_missing();

DROP PROCEDURE IF EXISTS zestgo_add_index_if_missing;
