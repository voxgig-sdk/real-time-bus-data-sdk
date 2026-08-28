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
| `data` | `table` | No |  |
| `generated_timestamp` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Eta():load({ stop_id = "stop_id" })
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
| `bound` | `string` | No | Direction of the route |
| `data` | `table` | No |  |
| `dest_en` | `string` | No | Destination stop name in English |
| `dest_sc` | `string` | No | Destination stop name in Simplified Chinese |
| `dest_tc` | `string` | No | Destination stop name in Traditional Chinese |
| `generated_timestamp` | `string` | No |  |
| `id` | `string` | No |  |
| `orig_en` | `string` | No | Origin stop name in English |
| `orig_sc` | `string` | No | Origin stop name in Simplified Chinese |
| `orig_tc` | `string` | No | Origin stop name in Traditional Chinese |
| `route` | `string` | No | Route number |
| `service_type` | `string` | No | Service type identifier |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

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
| `bound` | `string` | No | Direction of the route |
| `data` | `table` | No |  |
| `generated_timestamp` | `string` | No |  |
| `route` | `string` | No | Route number |
| `seq` | `string` | No | Stop sequence number on the route |
| `service_type` | `string` | No | Service type identifier |
| `stop` | `string` | No | Stop identifier |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:RouteStop():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:RouteStop():load({ direction = "direction", route = "route", service_type = "service_type" })
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
| `id` | `string` | No |  |
| `lat` | `string` | No | Latitude coordinate |
| `long` | `string` | No | Longitude coordinate |
| `name_en` | `string` | No | Stop name in English |
| `name_sc` | `string` | No | Stop name in Simplified Chinese |
| `name_tc` | `string` | No | Stop name in Traditional Chinese |
| `stop` | `string` | No | Stop identifier |

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


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

