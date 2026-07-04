# RealTimeBusData PHP SDK Reference

Complete API reference for the RealTimeBusData PHP SDK.


## RealTimeBusDataSDK

### Constructor

```php
require_once __DIR__ . '/real-time-bus-data_sdk.php';

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

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

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
| `co` | ``$STRING`` | No |  |
| `data` | ``$ARRAY`` | No |  |
| `data_timestamp` | ``$STRING`` | No |  |
| `dest_en` | ``$STRING`` | No |  |
| `dest_sc` | ``$STRING`` | No |  |
| `dest_tc` | ``$STRING`` | No |  |
| `dir` | ``$STRING`` | No |  |
| `eta` | ``$STRING`` | No |  |
| `eta_seq` | ``$INTEGER`` | No |  |
| `generated_timestamp` | ``$STRING`` | No |  |
| `rmk_en` | ``$STRING`` | No |  |
| `rmk_sc` | ``$STRING`` | No |  |
| `rmk_tc` | ``$STRING`` | No |  |
| `route` | ``$STRING`` | No |  |
| `seq` | ``$INTEGER`` | No |  |
| `service_type` | ``$INTEGER`` | No |  |
| `stop` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |
| `version` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Eta()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Eta()->load(["id" => "eta_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): EtaEntity`

Create a new `EtaEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## RouteEntity

```php
$route = $client->Route();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | ``$STRING`` | No |  |
| `data` | ``$ARRAY`` | No |  |
| `dest_en` | ``$STRING`` | No |  |
| `dest_sc` | ``$STRING`` | No |  |
| `dest_tc` | ``$STRING`` | No |  |
| `generated_timestamp` | ``$STRING`` | No |  |
| `orig_en` | ``$STRING`` | No |  |
| `orig_sc` | ``$STRING`` | No |  |
| `orig_tc` | ``$STRING`` | No |  |
| `route` | ``$STRING`` | No |  |
| `service_type` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |
| `version` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Route()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Route()->load(["id" => "route_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): RouteEntity`

Create a new `RouteEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## RouteStopEntity

```php
$route_stop = $client->RouteStop();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | ``$STRING`` | No |  |
| `route` | ``$STRING`` | No |  |
| `seq` | ``$STRING`` | No |  |
| `service_type` | ``$STRING`` | No |  |
| `stop` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->RouteStop()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): RouteStopEntity`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## StopEntity

```php
$stop = $client->Stop();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | ``$OBJECT`` | No |  |
| `generated_timestamp` | ``$STRING`` | No |  |
| `lat` | ``$STRING`` | No |  |
| `long` | ``$STRING`` | No |  |
| `name_en` | ``$STRING`` | No |  |
| `name_sc` | ``$STRING`` | No |  |
| `name_tc` | ``$STRING`` | No |  |
| `stop` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |
| `version` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Stop()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Stop()->load(["id" => "stop_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): StopEntity`

Create a new `StopEntity` instance with the same client and
options.

#### `getName(): string`

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

