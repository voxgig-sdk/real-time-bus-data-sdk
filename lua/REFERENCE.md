# RealTimeBusData Lua SDK Reference

Complete API reference for the RealTimeBusData Lua SDK.


## RealTimeBusDataSDK

### Constructor

```lua
local sdk = require("real-time-bus-data_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Eta(data)`

Create a new `Eta` entity instance. Pass `nil` for no initial data.

#### `Route(data)`

Create a new `Route` entity instance. Pass `nil` for no initial data.

#### `RouteStop(data)`

Create a new `RouteStop` entity instance. Pass `nil` for no initial data.

#### `Stop(data)`

Create a new `Stop` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## EtaEntity

```lua
local eta = client:Eta(nil)
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

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Eta():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Eta():load({ id = "eta_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EtaEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## RouteEntity

```lua
local route = client:Route(nil)
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

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Route():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Route():load({ id = "route_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## RouteStopEntity

```lua
local route_stop = client:RouteStop(nil)
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

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:RouteStop():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## StopEntity

```lua
local stop = client:Stop(nil)
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

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Stop():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Stop():load({ id = "stop_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `StopEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

