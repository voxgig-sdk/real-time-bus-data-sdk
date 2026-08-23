# RealTimeBusData Ruby SDK Reference

Complete API reference for the RealTimeBusData Ruby SDK.


## RealTimeBusDataSDK

### Constructor

```ruby
require_relative 'RealTimeBusData_sdk'

client = RealTimeBusDataSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `RealTimeBusDataSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = RealTimeBusDataSDK.test
```


### Instance Methods

#### `Eta(data = nil)`

Create a new `Eta` entity instance. Pass `nil` for no initial data.

#### `Route(data = nil)`

Create a new `Route` entity instance. Pass `nil` for no initial data.

#### `RouteStop(data = nil)`

Create a new `RouteStop` entity instance. Pass `nil` for no initial data.

#### `Stop(data = nil)`

Create a new `Stop` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## EtaEntity

```ruby
eta = client.Eta
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Array` | No |  |
| `generated_timestamp` | `String` | No |  |
| `type` | `String` | No |  |
| `version` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Eta.load({ "stop_id" => "stop_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `EtaEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## RouteEntity

```ruby
route = client.Route
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `String` | No | Direction of the route |
| `data` | `Array` | No |  |
| `dest_en` | `String` | No | Destination stop name in English |
| `dest_sc` | `String` | No | Destination stop name in Simplified Chinese |
| `dest_tc` | `String` | No | Destination stop name in Traditional Chinese |
| `generated_timestamp` | `String` | No |  |
| `orig_en` | `String` | No | Origin stop name in English |
| `orig_sc` | `String` | No | Origin stop name in Simplified Chinese |
| `orig_tc` | `String` | No | Origin stop name in Traditional Chinese |
| `route` | `String` | No | Route number |
| `service_type` | `String` | No | Service type identifier |
| `type` | `String` | No |  |
| `version` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Route.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Route.load({ "id" => "route_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `RouteEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## RouteStopEntity

```ruby
route_stop = client.RouteStop
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `String` | No | Direction of the route |
| `data` | `Array` | No |  |
| `generated_timestamp` | `String` | No |  |
| `route` | `String` | No | Route number |
| `seq` | `String` | No | Stop sequence number on the route |
| `service_type` | `String` | No | Service type identifier |
| `stop` | `String` | No | Stop identifier |
| `type` | `String` | No |  |
| `version` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.RouteStop.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.RouteStop.load({ "direction" => "direction", "route" => "route", "service_type" => "service_type" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## StopEntity

```ruby
stop = client.Stop
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `lat` | `String` | No | Latitude coordinate |
| `long` | `String` | No | Longitude coordinate |
| `name_en` | `String` | No | Stop name in English |
| `name_sc` | `String` | No | Stop name in Simplified Chinese |
| `name_tc` | `String` | No | Stop name in Traditional Chinese |
| `stop` | `String` | No | Stop identifier |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Stop.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Stop.load({ "id" => "stop_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `StopEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = RealTimeBusDataSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

