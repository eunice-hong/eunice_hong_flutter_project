
var serviceWorkerVersion = null;
var scriptLoaded = false;

// 
function loadMainDartJs() {
    if (scriptLoaded) {
        return;
    }
    scriptLoaded = true;
    var scriptTag = document.createElement('script');
    scriptTag.src = 'main.dart.js';
    scriptTag.type = 'application/javascript';
    document.body.append(scriptTag);
}

// 
function main() {
    if ('serviceWorker' in navigator) {
        // Service workers are supported. Use them.
        window.addEventListener('load', function () {
            // Wait for registration to finish before dropping the <script> tag.
            // Otherwise, the browser will load the script multiple times,
            // potentially different versions.
            var serviceWorkerUrl = 'flutter_service_worker.js?v=' + serviceWorkerVersion;
            navigator.serviceWorker.register(serviceWorkerUrl)
                .then((reg) => {
                    function waitForActivation(serviceWorker) {
                        serviceWorker.addEventListener('statechange', () => {
                            if (serviceWorker.state == 'activated') {
                                console.log('Installed new service worker.');
                                loadMainDartJs();
                            }
                        });
                    }
                    if (!reg.active && (reg.installing || reg.waiting)) {
                        waitForActivation(reg.installing || reg.waiting);
                    } else if (!reg.active.scriptURL.endsWith(serviceWorkerVersion)) {
                        console.log('New service worker available.');
                        reg.update();
                        waitForActivation(reg.installing);
                    } else {
                        // Existing service worker is still good.
                        console.log('Loading app from service worker.');
                        loadMainDartJs();
                    }
                });

            // If service worker doesn't succeed in a reasonable amount of time,
            // fallback to plaint <script> tag.
            setTimeout(() => {
                if (!scriptLoaded) {
                    console.warn(
                        'Failed to load app from service worker. Falling back to plain <script> tag.',
                    );
                    loadMainDartJs();
                }
            }, 4000);
        });
    } else {
        // Service workers not supported. Just drop the <script> tag.
        loadMainDartJs();
    }
}