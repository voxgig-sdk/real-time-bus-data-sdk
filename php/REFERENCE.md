# RealTimeBusData PHP SDK Reference

Complete API reference for the RealTimeBusData PHP SDK.


## RealTimeBusDataSDK

### Constructor

```php
require_once __DIR__ . '/realtimebusdata_sdk.php';

$client = new RealTimeBusDataSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `RealTimeBusDataSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = RealTimeBusDataSDK::test();
```


### Instance Methods

#### `Eta($data = null)`

Create a new `EtaEntity` instance. Pass `null` for no initial data.

#### `Route($data = null)`

Create a new `RouteEntity` instance. Pass `null` for no initial data.

#### `RouteStop($data = null)`

Create a new `RouteStopEntity` instance. Pass `null` for no initial data.

#### `Stop($data = null)`

Create a new `StopEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): RealTimeBusDataUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## EtaEntity

```php
$eta = $client->Eta();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `array` | No |  |
| `generated_timestamp` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Eta()->load(["stop_id" => "stop_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): EtaEntity`

Create a new `EtaEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## RouteEntity

```php
$route = $client->Route();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No |  |
| `data` | `array` | No |  |
| `dest_en` | `string` | No |  |
| `dest_sc` | `string` | No |  |
| `dest_tc` | `string` | No |  |
| `generated_timestamp` | `string` | No |  |
| `orig_en` | `string` | No |  |
| `orig_sc` | `string` | No |  |
| `orig_tc` | `string` | No |  |
| `route` | `string` | No |  |
| `service_type` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Route()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Route()->load(["id" => "route_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): RouteEntity`

Create a new `RouteEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## RouteStopEntity

```php
$route_stop = $client->RouteStop();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No |  |
| `data` | `array` | No |  |
| `generated_timestamp` | `string` | No |  |
| `route` | `string` | No |  |
| `seq` | `string` | No |  |
| `service_type` | `string` | No |  |
| `stop` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->RouteStop()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->RouteStop()->load(["direction" => "direction", "route" => "route", "service_type" => "service_type"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): RouteStopEntity`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## StopEntity

```php
$stop = $client->Stop();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `lat` | `string` | No |  |
| `long` | `string` | No |  |
| `name_en` | `string` | No |  |
| `name_sc` | `string` | No |  |
| `name_tc` | `string` | No |  |
| `stop` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Stop()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Stop()->load(["id" => "stop_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): StopEntity`

Create a new `StopEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new RealTimeBusDataSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

