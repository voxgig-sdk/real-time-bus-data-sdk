# RealTimeBusData Lua SDK



The Lua SDK for the RealTimeBusData API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Eta()` — each with the same small set of operations (`list`, `load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("real-time-bus-data_sdk")

local client = sdk.new()
```

### 3. Load an eta

Eta is nested under stop, so provide the `stop_id`.

```lua
local eta, err = client:Eta():load({ stop_id = "example_stop_id" })
if err then error(err) end
print(eta)
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local stops, err = client:Stop():list()
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Stop():list()
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
REAL_TIME_BUS_DATA_TEST_LIVE=TRUE
```

Then run:

```bash
cd lua && busted test/
```


## Reference

### RealTimeBusDataSDK

```lua
local sdk = require("real-time-bus-data_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### RealTimeBusDataSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
| `Eta` | `(data) -> EtaEntity` | Create an Eta entity instance. |
| `Route` | `(data) -> RouteEntity` | Create a Route entity instance. |
| `RouteStop` | `(data) -> RouteStopEntity` | Create a RouteStop entity instance. |
| `Stop` | `(data) -> StopEntity` | Create a Stop entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local eta, err = client:Eta():load()
    if err then error(err) end
    -- eta is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

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
| `id` |  |
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
| `id` |  |
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

Create an instance: `local eta = client:Eta(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `table` |  |
| `generated_timestamp` | `string` |  |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```lua
local eta, err = client:Eta():load({ stop_id = "stop_id" })
```


### Route

Create an instance: `local route = client:Route(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` | Direction of the route |
| `data` | `table` |  |
| `dest_en` | `string` | Destination stop name in English |
| `dest_sc` | `string` | Destination stop name in Simplified Chinese |
| `dest_tc` | `string` | Destination stop name in Traditional Chinese |
| `generated_timestamp` | `string` |  |
| `id` | `string` |  |
| `orig_en` | `string` | Origin stop name in English |
| `orig_sc` | `string` | Origin stop name in Simplified Chinese |
| `orig_tc` | `string` | Origin stop name in Traditional Chinese |
| `route` | `string` | Route number |
| `service_type` | `string` | Service type identifier |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```lua
local route, err = client:Route():load({ id = "route_id" })
```

#### Example: List

```lua
local routes, err = client:Route():list()
```


### RouteStop

Create an instance: `local route_stop = client:RouteStop(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` | Direction of the route |
| `data` | `table` |  |
| `generated_timestamp` | `string` |  |
| `route` | `string` | Route number |
| `seq` | `string` | Stop sequence number on the route |
| `service_type` | `string` | Service type identifier |
| `stop` | `string` | Stop identifier |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```lua
local route_stop, err = client:RouteStop():load({ direction = "direction", route = "route", service_type = "service_type" })
```

#### Example: List

```lua
local route_stops, err = client:RouteStop():list()
```


### Stop

Create an instance: `local stop = client:Stop(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `string` |  |
| `lat` | `string` | Latitude coordinate |
| `long` | `string` | Longitude coordinate |
| `name_en` | `string` | Stop name in English |
| `name_sc` | `string` | Stop name in Simplified Chinese |
| `name_tc` | `string` | Stop name in Traditional Chinese |
| `stop` | `string` | Stop identifier |

#### Example: Load

```lua
local stop, err = client:Stop():load({ id = "stop_id" })
```

#### Example: List

```lua
local stops, err = client:Stop():list()
```

## Features

This SDK ships 1 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`test`](#test) | In-memory mock transport for testing without a live server |

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.


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

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── real-time-bus-data_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`real-time-bus-data_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```lua
local stop = client:Stop()
stop:list()

-- stop:data_get() now returns the stop data from the last list
-- stop:match_get() returns the last match criteria
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
