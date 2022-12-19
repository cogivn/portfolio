'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "5f771b71967f92dc0d9b35b9d3be0676",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/AssetManifest.json": "798f0db5931301e31ea36be6390497ca",
"assets/shaders/ink_sparkle.frag": "ab4751ef630837e294889ca64470bb70",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "c41fd9a74ab08786c9c7e5f5db74895c",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/image.jpg": "057ab3ed52776195be998cbc138c8ca5",
"assets/assets/images/image2.webp": "a99baec4d087f3545c5be998ca33b86a",
"assets/assets/icons/ic_home.svg": "1b36c2e0a88a671df29957215b55eb64",
"assets/assets/icons/ic_about_us.svg": "214b674ea00841b1f2ac9b1491366ab6",
"assets/assets/icons/ic_home_active.svg": "0cab0328837e0e3afba4dc042fdc3cb8",
"assets/assets/icons/image2.jpg": "48bc9c98a2626b88fd77f4d8022b480c",
"assets/assets/fonts/roboto/Roboto-Black.ttf": "d6a6f8878adb0d8e69f9fa2e0b622924",
"assets/assets/fonts/monolisa/MonoLisa-Bold.ttf": "058375a0793dbb56ff78bc75972c309c",
"assets/assets/fonts/monolisa/MonoLisa-BlackItalic.ttf": "7a73b8873e80ab31d7a2a2119e86eadd",
"assets/assets/fonts/monolisa/MonoLisa-ExtraLightItalic.ttf": "35d145b50a1dcd56fe347b82742aa42b",
"assets/assets/fonts/monolisa/MonoLisa-MediumItalic.ttf": "a4df0d32ed8f5a62e7ad2a2ec8585009",
"assets/assets/fonts/monolisa/MonoLisa-ThinItalic.ttf": "9d20317979afde7d6819be6770178ca9",
"assets/assets/fonts/monolisa/MonoLisa-LightItalic.ttf": "c0c20465dc4c4effae561616e527eb06",
"assets/assets/fonts/monolisa/MonoLisa-Light.ttf": "2bff45f1cd886f036eaf45c9f9d905a7",
"assets/assets/fonts/monolisa/MonoLisa-RegularItalic.ttf": "47ed0b6c1803dbe41163f0034e7396f5",
"assets/assets/fonts/monolisa/MonoLisa-Medium.ttf": "4e8373613667a4ed6996ca22c39ee355",
"assets/assets/fonts/monolisa/MonoLisa-Regular.ttf": "a09f44d8e049b8f0b3bf74cdc0a9aa30",
"assets/assets/fonts/monolisa/MonoLisa-ExtraLight.ttf": "b014a9a1ee491cdcb9875fc0f24371b8",
"assets/assets/fonts/monolisa/MonoLisa-BoldItalic.ttf": "6e7fb70ab1457fa849f705fc845a0885",
"assets/assets/fonts/monolisa/MonoLisa-Thin.ttf": "c9c33d173bad1b2ed22f3a47f47bc9e3",
"assets/assets/fonts/monolisa/MonoLisa-Black.ttf": "ffc93c2a9c363f170888449a44200f1c",
"assets/NOTICES": "17f9a4f04b7ed1d99bef74308d015a7f",
"index.html": "adb822a92792358159c39b0d1b240cca",
"/": "adb822a92792358159c39b0d1b240cca",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "0d19e7e4d546bb5c7cb53ed237320aa7"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
