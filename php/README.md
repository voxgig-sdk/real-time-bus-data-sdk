# RealTimeBusData PHP SDK



The PHP SDK for the RealTimeBusData API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Eta()` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases](https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'realtimebusdata_sdk.php';

$client = new RealTimeBusDataSDK();
```

### 3. Load an eta

Eta is nested under stop, so provide the `stop_id`.

```php
try {
    // load() returns the ENTITY — call data_get() for the Eta record (throws on error).
    $eta = $client->Eta()->load(["stop_id" => "example_stop_id"]);
    print_r($eta);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $stops = $client->Stop()->list();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = RealTimeBusDataSDK::test([
    "entity" => ["stop" => ["test01" => ["id" => "test01"]]],
]);

// Entity ops return the ENTITY (throws on error);
// call data_get() for the mock record.
$stop = $client->Stop()->list();
print_r($stop);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new RealTimeBusDataSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
REAL_TIME_BUS_DATA_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### RealTimeBusDataSDK

```php
require_once 'realtimebusdata_sdk.php';
$client = new RealTimeBusDataSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = RealTimeBusDataSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### RealTimeBusDataSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Eta` | `($data): EtaEntity` | Create an Eta entity instance. |
| `Route` | `($data): RouteEntity` | Create a Route entity instance. |
| `RouteStop` | `($data): RouteStopEntity` | Create a RouteStop entity instance. |
| `Stop` | `($data): StopEntity` | Create a Stop entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### Eta

| Field | Description |
| --- | --- |
| `data` |  |
| `generated_timestamp` |  |
| `type` |  |
| `version` |  |

Operations: Load.

API path: `/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}`

#### Route

| Field | Description |
| --- | --- |
| `bound` | Direction of the route |
| `data` |  |
| `dest_en` | Destination stop name in English |
| `dest_sc` | Destination stop name in Simplified Chinese |
| `dest_tc` | Destination stop name in Traditional Chinese |
| `generated_timestamp` |  |
| `orig_en` | Origin stop name in English |
| `orig_sc` | Origin stop name in Simplified Chinese |
| `orig_tc` | Origin stop name in Traditional Chinese |
| `route` | Route number |
| `service_type` | Service type identifier |
| `type` |  |
| `version` |  |

Operations: List, Load.

API path: `/v1/transport/kmb/route`

#### RouteStop

| Field | Description |
| --- | --- |
| `bound` | Direction of the route |
| `data` |  |
| `generated_timestamp` |  |
| `route` | Route number |
| `seq` | Stop sequence number on the route |
| `service_type` | Service type identifier |
| `stop` | Stop identifier |
| `type` |  |
| `version` |  |

Operations: List, Load.

API path: `/v1/transport/kmb/route-stop`

#### Stop

| Field | Description |
| --- | --- |
| `lat` | Latitude coordinate |
| `long` | Longitude coordinate |
| `name_en` | Stop name in English |
| `name_sc` | Stop name in Simplified Chinese |
| `name_tc` | Stop name in Traditional Chinese |
| `stop` | Stop identifier |

Operations: List, Load.

API path: `/v1/transport/kmb/stop`



## Entities


### Eta

Create an instance: `$eta = $client->Eta();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `array` |  |
| `generated_timestamp` | `string` |  |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Eta record (throws on error).
$eta = $client->Eta()->load(["stop_id" => "stop_id"]);
```


### Route

Create an instance: `$route = $client->Route();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` | Direction of the route |
| `data` | `array` |  |
| `dest_en` | `string` | Destination stop name in English |
| `dest_sc` | `string` | Destination stop name in Simplified Chinese |
| `dest_tc` | `string` | Destination stop name in Traditional Chinese |
| `generated_timestamp` | `string` |  |
| `orig_en` | `string` | Origin stop name in English |
| `orig_sc` | `string` | Origin stop name in Simplified Chinese |
| `orig_tc` | `string` | Origin stop name in Traditional Chinese |
| `route` | `string` | Route number |
| `service_type` | `string` | Service type identifier |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Route record (throws on error).
$route = $client->Route()->load(["id" => "route_id"]);
```

#### Example: List

```php
// list() returns an array of Route records (throws on error).
$routes = $client->Route()->list();
```


### RouteStop

Create an instance: `$route_stop = $client->RouteStop();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` | Direction of the route |
| `data` | `array` |  |
| `generated_timestamp` | `string` |  |
| `route` | `string` | Route number |
| `seq` | `string` | Stop sequence number on the route |
| `service_type` | `string` | Service type identifier |
| `stop` | `string` | Stop identifier |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the RouteStop record (throws on error).
$route_stop = $client->RouteStop()->load(["direction" => "direction", "route" => "route", "service_type" => "service_type"]);
```

#### Example: List

```php
// list() returns an array of RouteStop records (throws on error).
$route_stops = $client->RouteStop()->list();
```


### Stop

Create an instance: `$stop = $client->Stop();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `lat` | `string` | Latitude coordinate |
| `long` | `string` | Longitude coordinate |
| `name_en` | `string` | Stop name in English |
| `name_sc` | `string` | Stop name in Simplified Chinese |
| `name_tc` | `string` | Stop name in Traditional Chinese |
| `stop` | `string` | Stop identifier |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Stop record (throws on error).
$stop = $client->Stop()->load(["id" => "stop_id"]);
```

#### Example: List

```php
// list() returns an array of Stop records (throws on error).
$stops = $client->Stop()->list();
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── realtimebusdata_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`realtimebusdata_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$stop = $client->Stop();
$stop->list();

// $stop->data_get() now returns the stop data from the last list
// $stop->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
