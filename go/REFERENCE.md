# RealTimeBusData Golang SDK Reference

Complete API reference for the RealTimeBusData Golang SDK.


## RealTimeBusDataSDK

### Constructor

```go
func NewRealTimeBusDataSDK(options map[string]any) *RealTimeBusDataSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *RealTimeBusDataSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *RealTimeBusDataSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Eta(data map[string]any) RealTimeBusDataEntity`

Create a new `Eta` entity instance. Pass `nil` for no initial data.

#### `Route(data map[string]any) RealTimeBusDataEntity`

Create a new `Route` entity instance. Pass `nil` for no initial data.

#### `RouteStop(data map[string]any) RealTimeBusDataEntity`

Create a new `RouteStop` entity instance. Pass `nil` for no initial data.

#### `Stop(data map[string]any) RealTimeBusDataEntity`

Create a new `Stop` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## EtaEntity

```go
eta := client.Eta(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `co` | `string` | No |  |
| `data` | `[]any` | No |  |
| `data_timestamp` | `string` | No |  |
| `dest_en` | `string` | No |  |
| `dest_sc` | `string` | No |  |
| `dest_tc` | `string` | No |  |
| `dir` | `string` | No |  |
| `eta` | `string` | No |  |
| `eta_seq` | `int` | No |  |
| `generated_timestamp` | `string` | No |  |
| `rmk_en` | `string` | No |  |
| `rmk_sc` | `string` | No |  |
| `rmk_tc` | `string` | No |  |
| `route` | `string` | No |  |
| `seq` | `int` | No |  |
| `service_type` | `int` | No |  |
| `stop` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Eta(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Eta(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `EtaEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## RouteEntity

```go
route := client.Route(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No |  |
| `data` | `[]any` | No |  |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Route(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Route(nil).Load(map[string]any{"id": "route_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `RouteEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## RouteStopEntity

```go
route_stop := client.RouteStop(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No |  |
| `route` | `string` | No |  |
| `seq` | `string` | No |  |
| `service_type` | `string` | No |  |
| `stop` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.RouteStop(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## StopEntity

```go
stop := client.Stop(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `map[string]any` | No |  |
| `generated_timestamp` | `string` | No |  |
| `lat` | `string` | No |  |
| `long` | `string` | No |  |
| `name_en` | `string` | No |  |
| `name_sc` | `string` | No |  |
| `name_tc` | `string` | No |  |
| `stop` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Stop(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Stop(nil).Load(map[string]any{"id": "stop_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `StopEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewRealTimeBusDataSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

