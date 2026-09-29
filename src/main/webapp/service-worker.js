/* ============================================================
   ZestGo service worker
   - Static assets (images, fonts, JS, CSS): cache-first
   - Page navigations (JSP): network-first, offline fallback
   - Never caches POST responses or non-GET requests
   ============================================================ */

const CACHE_NAME = "zestgo-v2";

/* Pre-cached at install: the shell every page needs */
const PRECACHE = [
    "./",
    "./manifest.json",
    "./Image/ZestGo.png",
    "./Image/ZestGo-192.png",
    "./Image/ZestGo-512.png",
    "./js/pwa.js"
];

self.addEventListener("install", event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => cache.addAll(PRECACHE))
            .then(() => self.skipWaiting())
    );
});

self.addEventListener("activate", event => {
    event.waitUntil(
        caches.keys()
            .then(keys =>
                Promise.all(
                    keys
                        .filter(key => key !== CACHE_NAME)
                        .map(key => caches.delete(key))
                )
            )
            .then(() => self.clients.claim())
    );
});

self.addEventListener("fetch", event => {

    const request = event.request;

    /* Only handle safe GET requests */
    if (request.method !== "GET") {
        return;
    }

    const url = new URL(request.url);

    /* Different origin (Google Fonts CDN): cache-first */
    const isStatic =
        url.origin !== self.location.origin ||
        url.pathname.includes("/Image/") ||
        url.pathname.includes("/js/");

    if (isStatic) {

        /* CACHE-FIRST: instant repeat loads, works offline */
        event.respondWith(
            caches.match(request).then(cached => {

                if (cached) {
                    return cached;
                }

                return fetch(request).then(response => {

                    if (response && response.status === 200) {
                        const clone = response.clone();
                        caches.open(CACHE_NAME).then(cache => {
                            cache.put(request, clone);
                        });
                    }

                    return response;
                });
            })
        );

        return;
    }

    /* Same-origin pages (JSP): NETWORK-FIRST with offline fallback.
       JSPs render user-specific content, so we prefer fresh. */
    event.respondWith(
        fetch(request)
            .then(response => {

                if (response && response.status === 200
                        && response.type === "basic") {
                    const clone = response.clone();
                    caches.open(CACHE_NAME).then(cache => {
                        cache.put(request, clone);
                    });
                }

                return response;
            })
            .catch(() =>
                caches.match(request).then(cached => {
                    return cached || caches.match("./");
                })
            )
    );
});
