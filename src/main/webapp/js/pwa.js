/* ============================================================
   ZestGo PWA bootstrap
   - Registers the service worker (offline support + installability)
   - Manages the floating "Install App" button via beforeinstallprompt
   - Shows "ZestGo is now your app" toast after successful install
   ============================================================ */

(function () {
    "use strict";

    /* --------------------------------------------------------
       1. SERVICE WORKER REGISTRATION
    -------------------------------------------------------- */

    if ("serviceWorker" in navigator) {

        window.addEventListener("load", function () {

            navigator.serviceWorker
                .register("service-worker.js")
                .then(function (registration) {

                    // Check for a newer service worker on page load
                    registration.addEventListener(
                        "updatefound",
                        function () {
                            // New SW installing in background;
                            // it takes over on next reload.
                        }
                    );

                })
                .catch(function (err) {
                    console.warn(
                        "ZestGo: service worker registration failed:",
                        err
                    );
                });
        });
    }

    /* --------------------------------------------------------
       2. INSTALL BUTTON
    -------------------------------------------------------- */

    var deferredPrompt = null;
    var installBtn = null;

    function ensureButton() {

        if (installBtn) {
            return installBtn;
        }

        installBtn = document.createElement("button");

        installBtn.id = "zestgo-install-btn";
        installBtn.type = "button";
        installBtn.setAttribute("aria-label", "Install ZestGo app");

        installBtn.innerHTML =
            '<span class="zi-icon">⬇</span>' +
            '<span class="zi-text">Install App</span>';

        installBtn.addEventListener("click", function () {

            if (!deferredPrompt) {
                return;
            }

            deferredPrompt.prompt();

            deferredPrompt.userChoice.then(function (choice) {

                if (choice && choice.outcome === "accepted") {
                    hideButton();
                }

                deferredPrompt = null;
            });
        });

        document.body.appendChild(installBtn);

        // Entrance animation
        requestAnimationFrame(function () {
            installBtn.classList.add("zi-show");
        });

        return installBtn;
    }

    function hideButton() {

        if (!installBtn) {
            return;
        }

        installBtn.classList.remove("zi-show");

        setTimeout(function () {
            if (installBtn) {
                installBtn.remove();
                installBtn = null;
            }
        }, 350);
    }

    /* Chrome/Edge/Android: fired when installable */
    window.addEventListener(
        "beforeinstallprompt",
        function (e) {

            e.preventDefault();
            deferredPrompt = e;

            var standalone =
                window.matchMedia(
                    "(display-mode: standalone)"
                ).matches ||
                window.navigator.standalone === true;

            if (!standalone) {
                ensureButton();
            }
        }
    );

    /* Clean up once actually installed */
    window.addEventListener(
        "appinstalled",
        function () {
            deferredPrompt = null;
            hideButton();
            showToast();
        }
    );

    /* --------------------------------------------------------
       3. POST-INSTALL TOAST
    -------------------------------------------------------- */

    function showToast() {

        var toast = document.createElement("div");

        toast.id = "zestgo-install-toast";

        toast.innerHTML =
            '<span class="zt-icon">🎉</span>' +
            '<span>ZestGo installed! Launch it from your home screen.</span>';

        document.body.appendChild(toast);

        setTimeout(function () {
            toast.classList.add("zt-show");
        }, 100);

        setTimeout(function () {
            toast.classList.remove("zt-show");
            setTimeout(function () {
                toast.remove();
            }, 400);
        }, 4500);
    }

    /* --------------------------------------------------------
       4. STYLES
       (injected so every page gets the button without
        copy-pasting CSS)
    -------------------------------------------------------- */

    var css =
        "#zestgo-install-btn{" +
        "position:fixed;" +
        "bottom:22px;" +
        "right:22px;" +
        "z-index:2147483000;" +
        "display:flex;" +
        "align-items:center;" +
        "gap:9px;" +
        "padding:13px 20px;" +
        "border:none;" +
        "border-radius:999px;" +
        "cursor:pointer;" +
        "font-family:'Space Grotesk','DM Sans',sans-serif;" +
        "font-size:14px;" +
        "font-weight:700;" +
        "color:#0a1718;" +
        "background:linear-gradient(135deg,#e0bd67,#b98b36);" +
        "box-shadow:0 12px 30px rgba(201,162,75,0.4);" +
        "opacity:0;" +
        "transform:translateY(20px);" +
        "transition:opacity 0.35s ease,transform 0.35s ease;" +
        "}" +

        "#zestgo-install-btn.zi-show{" +
        "opacity:1;" +
        "transform:translateY(0);" +
        "}" +

        "#zestgo-install-btn:hover{" +
        "filter:brightness(1.07);" +
        "transform:translateY(-2px);" +
        "box-shadow:0 16px 36px rgba(201,162,75,0.5);" +
        "}" +

        "#zestgo-install-btn:active{" +
        "transform:translateY(0) scale(0.97);" +
        "}" +

        ".zi-icon{" +
        "font-size:16px;" +
        "line-height:1;" +
        "}" +

        "@media (max-width:600px){" +
        "#zestgo-install-btn{bottom:16px;right:16px;padding:12px 16px;font-size:13px;}" +
        "}" +

        "#zestgo-install-toast{" +
        "position:fixed;" +
        "bottom:22px;" +
        "left:50%;" +
        "transform:translate(-50%,20px);" +
        "z-index:2147483000;" +
        "display:flex;" +
        "align-items:center;" +
        "gap:10px;" +
        "max-width:92vw;" +
        "padding:14px 20px;" +
        "border-radius:14px;" +
        "background:rgba(15,42,46,0.97);" +
        "color:#EFE9DC;" +
        "font-family:'Space Grotesk','DM Sans',sans-serif;" +
        "font-size:14px;" +
        "font-weight:600;" +
        "box-shadow:0 16px 40px rgba(0,0,0,0.45);" +
        "border:1px solid rgba(201,162,75,0.4);" +
        "opacity:0;" +
        "transition:opacity 0.4s ease,transform 0.4s ease;" +
        "}" +

        "#zestgo-install-toast.zt-show{" +
        "opacity:1;" +
        "transform:translate(-50%,0);" +
        "}" +

        ".zt-icon{font-size:18px;}";

    var style = document.createElement("style");

    style.textContent = css;

    document.head.appendChild(style);

})();
