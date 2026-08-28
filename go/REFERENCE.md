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
fmt.Println(eta.GetName()) // "eta"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[]any` | No |  |
| `generated_timestamp` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Eta(nil).Load(map[string]any{"stop_id": "stop_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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
fmt.Println(route.GetName()) // "route"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No | Direction of the route |
| `data` | `[]any` | No |  |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Route(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Route(nil).Load(map[string]any{"id": "route_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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
routeStop := client.RouteStop(nil)
fmt.Println(routeStop.GetName()) // "route_stop"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No | Direction of the route |
| `data` | `[]any` | No |  |
| `generated_timestamp` | `string` | No |  |
| `route` | `string` | No | Route number |
| `seq` | `string` | No | Stop sequence number on the route |
| `service_type` | `string` | No | Service type identifier |
| `stop` | `string` | No | Stop identifier |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.RouteStop(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.RouteStop(nil).Load(map[string]any{"direction": "direction", "route": "route", "service_type": "service_type"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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
fmt.Println(stop.GetName()) // "stop"
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Stop(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Stop(nil).Load(map[string]any{"id": "stop_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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

