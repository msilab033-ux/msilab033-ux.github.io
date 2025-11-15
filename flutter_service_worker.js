'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "ad9235abb88576f2f435d1507b1a2866",
".git/config": "b387b5005f8a0ddfc1003a1bcc21bd7a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "b453b6610b81a4791123c5936d91a532",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "607cd100835bd3374f717c3fa70d8285",
".git/logs/refs/heads/main": "b8c8f5493b753c22c603ec7d80208ddc",
".git/logs/refs/remotes/origin/main": "6b0f89450cde60313cf06cef5d7cb1eb",
".git/objects/03/4f1d24b8f19ce510fa5e3c121d3880009a53da": "fcbed5cda46447c785893ee09210f556",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/04/d33f0fb06db457ffe69126fcfe44432e776c2e": "6930c24715637e05e9786096302c0158",
".git/objects/0a/cdca51513ef6a4fcda4c57d0cb5cc3d49a1619": "a39b5b4ad71f677d4dc37f620b141acc",
".git/objects/14/fa9ee78a1063a91757c14624288248a2b74563": "db5a70de826e948263a7c6fe29b3cecd",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1b/2a7f2a0d059375302a12703e88d7e2920a30bc": "7712ae1b572171f047d1d94f66498e95",
".git/objects/1e/b8b9f4d88bef14ce4a62dd91b012d5c8368a11": "9c5e83bcdc2721f1d9e8d668a02a0642",
".git/objects/27/34b0de10191181c2791e41fe7b3ab31264b06c": "984a65b0e2ba6a43ca95a0cf36e1007d",
".git/objects/27/a61c0a377ad95bad1c4b5dd526c6f8ea86cd68": "a3ece1f9a44babb32898dc740a489865",
".git/objects/28/eb51c5c981ff471f71a5beb27398e7f45e3bdd": "549673526f8fa0de04008f13663128ba",
".git/objects/29/929ffa1ae7d497c528293789648b2d936ff3a4": "e86873d291b1662e9b3aaa51084877c8",
".git/objects/30/4a0d2ce3bab7384444a124cc80f38c6bf223c3": "509908da4a1b8e2fa41034bea2805bac",
".git/objects/35/32911e84ddef6be18aa5f056791274dea5211e": "e97e76d3e0fadb154ab620811c2acb84",
".git/objects/36/1494cea9fab6a76252c47c7cc88c45cf16e362": "7446e47d7c312c8a17bc5c000379f4e0",
".git/objects/38/a655aeb8df340cf270fc1305785382464cd806": "1d6ccc5c30b2d37c9666c2df1d89c40f",
".git/objects/41/780c42ae8660aa7dc299ed2a0acd6f8ccc94ea": "1a94cd46ac8bb193740516db90498afc",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4b/719dd140500560243d5f1ff7ca351934274976": "e77ea31b239146eb09ca5b1a1d237164",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/4d/b755432b2e97dc4323b05ea7672d3cc8fed1f9": "2122f209ffd4320ad1eacb8476108a61",
".git/objects/51/daca2fdc0f4acf5fbd3ed173a2c69d8cca2286": "a7d50077c51c6f1571d925099b955844",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/56/97ba42c2c4f684daa3d2b73dbb28a769f51bea": "93374051966cf3dc65084833abfd650b",
".git/objects/56/ed1645550377f0abca6793add10883ee0f5484": "34dca158d71014309341bb7ab453881a",
".git/objects/5f/8460a72e1ad7c7740b8b2defc8041522ff6f21": "5b61fd3fe1db2287085eb46969269685",
".git/objects/61/4e1751cd38274860076a8df1d100753c51d33b": "c94bfd25e9af5ec04ee5612f2fc431b6",
".git/objects/62/f49b5ac8e9d9fe6fbbfa7147a115850219ffd5": "2c2ea7eda286f629e459f0c647b5cd6e",
".git/objects/64/e66cfe6da061e88eb120a2f2b622e071a32d95": "7214667e24d54590c003070b3d0ce740",
".git/objects/64/f5d9cd586573e33e534264151bd6cfa9844265": "023a45ab5af10e653bf5c8ca84d87764",
".git/objects/69/81f8a3857d5bbe9a535660c99feb723a6f80ab": "1a913d22907c75c6d5445a123023a9e8",
".git/objects/69/dd618354fa4dade8a26e0fd18f5e87dd079236": "8cc17911af57a5f6dc0b9ee255bb1a93",
".git/objects/6a/4b1a15bf9bb2993e0162250e1e6a4ed24ae015": "2d2aaa33e8bbee79af933d21b57d8e81",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6c/38a8e10c214bbfb7822a1d329bdfe970d07018": "400082908a0cfe2fc75ecba88853f657",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/71/093bd2ccde87281ab1c6848a4c8a53954ed78b": "e41bd019d20ffed1bfb18e7a915119c0",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/74/60e70f6f11301d19a203e3408972ceb0173fd7": "d7c656d5138b81ec70c2f75301867c06",
".git/objects/74/ec637acd9bd62807d62d87b92e9f57a82dfed6": "a9b7e90bcf5e80c798237c6b20659750",
".git/objects/7a/677ecfc904208b2ae279149cac74c8e39ba5e4": "daa7b94316c5efa83ea61d4df4af03fc",
".git/objects/80/48cd6d40eb4428f8b122bdb0f96a8df9343067": "6097ec9881b38cd5b5bffcd7a9a95c8b",
".git/objects/82/95b7dba4798ccc063b12d301ad3886ebad70a6": "3819ca9430df5d559146849c33572a38",
".git/objects/82/ac330d166791ec67bf087dd9713fdd1a75e70e": "c320d88af2f709aac29ecf0d087f7c2e",
".git/objects/83/91345ce0c8e5f42a95671ca55eb7d8039123f1": "ec7e543398d93c312d88b4c60e4ef0bd",
".git/objects/86/bf4a2ea33c9f1ae1defcc140ed22239fb4f0ef": "5b28d81a07b9df4a16d9004d6934f9fb",
".git/objects/88/3f66707d933aa5fff5d790f0a85022c4fb4361": "f1e4f65bba19b83907f8dd9b2ce1e396",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/8e/6df35a275879392254e514df1334c0ed89992a": "734453f3b07a9a49b5ce2e0c506b6728",
".git/objects/8e/bfdb53ee2140f57af6c330944a4b005c14ccd2": "a0c0a3fe3cf3fe8a0d1ca25846c3400a",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "e3695ae5742d7e56a9c696f82745288d",
".git/objects/92/7d843027142218fecc0d7d57d271a02d1becf7": "5991ff7c83e08f80b5eeb33260a0f6c5",
".git/objects/95/846bc5c2a7ef81a36c50e978d0687779e4a59e": "9966444b1765aee96ccd43b0407e45ae",
".git/objects/95/c71aea159a656b9001c5f586a66fd8e21d2f0c": "b305d37c2dafb3075860342c3dcac7e4",
".git/objects/98/b0776b4c1bf4f1d754b229226ac9fa3bcb2e85": "1f1aab136cfe5535af2adf5d5d9bae76",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/a2/bc2ed9a5413a65cb1c44aafc878fb44fe95474": "7963d51c37f1e2b0b8c68d26e01a8274",
".git/objects/ac/70b3ff1a800f3b57150946222aa4d8975eed50": "61bb04ee0b58a79ffbb9662775030e5c",
".git/objects/b3/ee504a448714e836af236f3236be5863079f79": "d09053df60e28808b2707050287eead7",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/ba/8ffbb98973f59dba9545d6c88e5938f5118bcc": "db87af552333977061eca8f7107b9983",
".git/objects/bc/b378e3249e7a523f2b0be55d986f0bf1810ca4": "3400659aa6ecc0def2ad4d212f3691c6",
".git/objects/bd/a58d5d1cb9650c85e72d593605906606ae2c8e": "c4038081974801a5984dce6230e7b077",
".git/objects/c2/b9e487648e7d1ddc52771839f5f2c0af892028": "5a612ab6741749ac5e5ff9cc37300d5b",
".git/objects/c3/32f33ff800eb736a8548645eada9f8f710e079": "b823157a9c990fca569f6a4a309931ba",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/c9/a96c570f727f4b0fbe0183482f1a45965c885d": "795d6b27807a48bbba882b818dcbffb4",
".git/objects/d2/dcf1681260c715f3eb637e41a910bacad8946f": "5c2bd53a9d01b5642af6bda602df91f9",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/8ab615babd95293197495db770f44a9fb05c50": "776df6c4c2fc592c2bdefefda0fc2727",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e1/53ef87cd2b2e58c3a2e45eaf4438f541ac4db2": "22a022d27ec58206ee84161eae465bab",
".git/objects/e6/a534117dfd5f80bf38f32319e350c8c4c61f73": "6b679fccf5bb4d23630db9a9b5d09c93",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/44416cfc70d1c9950272c60e3df282f002808f": "18ec5ab230825ff3f15d8e05afec7a42",
".git/objects/ef/52c889e6984201d4085519a286bcba41403923": "8745d7500531143c7529a103f8fce303",
".git/objects/f0/2929418b19035fb7efa94c59259106f8b54458": "275d1abfc93615827440b975d540969e",
".git/objects/f1/e6a1e707cc227488079e922f7a12fb29615188": "e81cd5578aaa8e28d2a7d727912c437c",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f8/51f096cc041391cf8671c4097e353d057146d2": "08bfe36a1b8d7a7a5bbf32efc378eee5",
".git/objects/f8/cde8f3fb616d8970536661ad92fdc1a6cc22d0": "0737f290c020b8144e008d8af3f6549d",
".git/objects/fb/0a66f6a3850094b96204419f896b7e557c9936": "c6375b3d8fa51ceae548be85b46e0342",
".git/refs/heads/main": "da656a9ec25e916ada0d3292f56c5648",
".git/refs/remotes/origin/main": "da656a9ec25e916ada0d3292f56c5648",
"assets/assests/logo.png": "0a544f08e173d8bfab41f3a920acbc6c",
"assets/AssetManifest.bin": "8e228b58c3bab90a653702c5b9b41b2f",
"assets/AssetManifest.bin.json": "4f7255fb92470119ffc994bf7dee95ed",
"assets/AssetManifest.json": "c11a84954cf72bcb38b80c2b7450e2c5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d1cfb5e1767da8bb6600685dc87ef963",
"assets/NOTICES": "4b938e9c58d30e03280286d89d57fab3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "3c82643443cdc171c00541935901a6a8",
"icons/logo192.png": "fd13efa248425896f36756769c21c71e",
"icons/logo512.png": "65f85384ebb132b5d373a17fe218b07d",
"index.html": "d59d5b17b82e9dfbef4038bf6a8bea93",
"/": "d59d5b17b82e9dfbef4038bf6a8bea93",
"main.dart.js": "ff7ce57fea42dc3714083a8370beb414",
"manifest.json": "9fd611ea8209a7b137a8467cea397c3f",
"version.json": "a2e21a8b1c42397bab48b6810d1e2e8c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
