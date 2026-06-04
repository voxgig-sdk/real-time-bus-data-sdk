# RealTimeBusData Python SDK

The Python SDK for the RealTimeBusData API. Provides an entity-oriented interface following Pythonic conventions.


## Install
```bash
pip install real-time-bus-data-sdk
```

Or install from source:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
from realtimebusdata_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK({})
```

### 2. List etas

```python
result, err = client.Eta(None).list(None, None)
if err:
    raise Exception(err)

if isinstance(result, list):
    for item in result:
        d = item.data_get()
        print(d["id"], d["name"])
```

### 3. Load a eta

```python
result, err = client.Eta(None).load({"id": "example_id"}, None)
if err:
    raise Exception(err)
print(result)
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
if err:
    raise Exception(err)

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
```

### Prepare a request without sending it

```python
fetchdef, err = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})
if err:
    raise Exception(err)

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = RealTimeBusDataSDK.test(None, None)

result, err = client.RealTimeBusData(None).load(
    {"id": "test01"}, None
)
# result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = RealTimeBusDataSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
REAL-TIME-BUS-DATA_TEST_LIVE=TRUE
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### RealTimeBusDataSDK

```python
from realtimebusdata_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = RealTimeBusDataSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### RealTimeBusDataSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> (dict, err)` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> (dict, err)` | Build and send an HTTP request. |
| `Eta` | `(data) -> EtaEntity` | Create a Eta entity instance. |
| `Route` | `(data) -> RouteEntity` | Create a Route entity instance. |
| `RouteStop` | `(data) -> RouteStopEntity` | Create a RouteStop entity instance. |
| `Stop` | `(data) -> StopEntity` | Create a Stop entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> (any, err)` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> (any, err)` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> (any, err)` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> (any, err)` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> (any, err)` | Remove an entity. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return `(any, err)`. The first value is a
`dict` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

### Entities

#### Eta

| Field | Description |
| --- | --- |
| `co` |  |
| `data` |  |
| `data_timestamp` |  |
| `dest_en` |  |
| `dest_sc` |  |
| `dest_tc` |  |
| `dir` |  |
| `eta` |  |
| `eta_seq` |  |
| `generated_timestamp` |  |
| `rmk_en` |  |
| `rmk_sc` |  |
| `rmk_tc` |  |
| `route` |  |
| `seq` |  |
| `service_type` |  |
| `stop` |  |
| `type` |  |
| `version` |  |

Operations: List, Load.

API path: `/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}`

#### Route

| Field | Description |
| --- | --- |
| `bound` |  |
| `data` |  |
| `dest_en` |  |
| `dest_sc` |  |
| `dest_tc` |  |
| `generated_timestamp` |  |
| `orig_en` |  |
| `orig_sc` |  |
| `orig_tc` |  |
| `route` |  |
| `service_type` |  |
| `type` |  |
| `version` |  |

Operations: List, Load.

API path: `/v1/transport/kmb/route`

#### RouteStop

| Field | Description |
| --- | --- |
| `bound` |  |
| `route` |  |
| `seq` |  |
| `service_type` |  |
| `stop` |  |

Operations: List.

API path: `/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}`

#### Stop

| Field | Description |
| --- | --- |
| `data` |  |
| `generated_timestamp` |  |
| `lat` |  |
| `long` |  |
| `name_en` |  |
| `name_sc` |  |
| `name_tc` |  |
| `stop` |  |
| `type` |  |
| `version` |  |

Operations: List, Load.

API path: `/v1/transport/kmb/stop`



## Entities


### Eta

Create an instance: `const eta = client.Eta()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `co` | ``$STRING`` |  |
| `data` | ``$ARRAY`` |  |
| `data_timestamp` | ``$STRING`` |  |
| `dest_en` | ``$STRING`` |  |
| `dest_sc` | ``$STRING`` |  |
| `dest_tc` | ``$STRING`` |  |
| `dir` | ``$STRING`` |  |
| `eta` | ``$STRING`` |  |
| `eta_seq` | ``$INTEGER`` |  |
| `generated_timestamp` | ``$STRING`` |  |
| `rmk_en` | ``$STRING`` |  |
| `rmk_sc` | ``$STRING`` |  |
| `rmk_tc` | ``$STRING`` |  |
| `route` | ``$STRING`` |  |
| `seq` | ``$INTEGER`` |  |
| `service_type` | ``$INTEGER`` |  |
| `stop` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```ts
const eta = await client.Eta().load({ id: 'eta_id' })
```

#### Example: List

```ts
const etas = await client.Eta().list()
```


### Route

Create an instance: `const route = client.Route()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | ``$STRING`` |  |
| `data` | ``$ARRAY`` |  |
| `dest_en` | ``$STRING`` |  |
| `dest_sc` | ``$STRING`` |  |
| `dest_tc` | ``$STRING`` |  |
| `generated_timestamp` | ``$STRING`` |  |
| `orig_en` | ``$STRING`` |  |
| `orig_sc` | ``$STRING`` |  |
| `orig_tc` | ``$STRING`` |  |
| `route` | ``$STRING`` |  |
| `service_type` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```ts
const route = await client.Route().load({ id: 'route_id' })
```

#### Example: List

```ts
const routes = await client.Route().list()
```


### RouteStop

Create an instance: `const route_stop = client.RouteStop()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | ``$STRING`` |  |
| `route` | ``$STRING`` |  |
| `seq` | ``$STRING`` |  |
| `service_type` | ``$STRING`` |  |
| `stop` | ``$STRING`` |  |

#### Example: List

```ts
const route_stops = await client.RouteStop().list()
```


### Stop

Create an instance: `const stop = client.Stop()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | ``$OBJECT`` |  |
| `generated_timestamp` | ``$STRING`` |  |
| `lat` | ``$STRING`` |  |
| `long` | ``$STRING`` |  |
| `name_en` | ``$STRING`` |  |
| `name_sc` | ``$STRING`` |  |
| `name_tc` | ``$STRING`` |  |
| `stop` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```ts
const stop = await client.Stop().load({ id: 'stop_id' })
```

#### Example: List

```ts
const stops = await client.Stop().list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

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

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as the second element in the return tuple.

### Features and hooks

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── realtimebusdata_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`realtimebusdata_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```python
moon = client.Moon()
moon.load({"planet_id": "earth", "id": "luna"})

# moon.data_get() now returns the loaded moon data
# moon.match_get() returns the last match criteria
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
