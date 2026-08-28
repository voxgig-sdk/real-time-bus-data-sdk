# RealTimeBusData Python SDK



The Python SDK for the RealTimeBusData API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Eta()` — each
carrying a small, uniform set of operations (`list`, `load`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
from realtimebusdata_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK()
```

### 3. Load an eta

Eta is nested under stop, so provide the `stop_id`.
`load()` returns the ENTITY — call data_get() for the record — and raises on error.

```python
try:
    eta = client.Eta().load({"stop_id": "example_stop_id"})
    print(eta)
except Exception as err:
    print(f"load failed: {err}")
```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    stops = client.Stop().list()
    print(stops)
except Exception as err:
    print(f"list failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = RealTimeBusDataSDK.test()

# Entity ops return the ENTITY and raises on error;
# call data_get() for the record.
stop = client.Stop().list()
# stop contains the mock response record
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
REAL_TIME_BUS_DATA_TEST_LIVE=TRUE
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
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `Eta` | `(data) -> EtaEntity` | Create an Eta entity instance. |
| `Route` | `(data) -> RouteEntity` | Create a Route entity instance. |
| `RouteStop` | `(data) -> RouteStopEntity` | Create a RouteStop entity instance. |
| `Stop` | `(data) -> StopEntity` | Create a Stop entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

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

Create an instance: `eta = client.Eta()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `list` |  |
| `generated_timestamp` | `str` |  |
| `type` | `str` |  |
| `version` | `str` |  |

#### Example: Load

```python
eta = client.Eta().load({"stop_id": "stop_id"})
```


### Route

Create an instance: `route = client.Route()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `str` | Direction of the route |
| `data` | `list` |  |
| `dest_en` | `str` | Destination stop name in English |
| `dest_sc` | `str` | Destination stop name in Simplified Chinese |
| `dest_tc` | `str` | Destination stop name in Traditional Chinese |
| `generated_timestamp` | `str` |  |
| `id` | `str` |  |
| `orig_en` | `str` | Origin stop name in English |
| `orig_sc` | `str` | Origin stop name in Simplified Chinese |
| `orig_tc` | `str` | Origin stop name in Traditional Chinese |
| `route` | `str` | Route number |
| `service_type` | `str` | Service type identifier |
| `type` | `str` |  |
| `version` | `str` |  |

#### Example: Load

```python
route = client.Route().load({"id": "route_id"})
```

#### Example: List

```python
routes = client.Route().list()
```


### RouteStop

Create an instance: `route_stop = client.RouteStop()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `str` | Direction of the route |
| `data` | `list` |  |
| `generated_timestamp` | `str` |  |
| `route` | `str` | Route number |
| `seq` | `str` | Stop sequence number on the route |
| `service_type` | `str` | Service type identifier |
| `stop` | `str` | Stop identifier |
| `type` | `str` |  |
| `version` | `str` |  |

#### Example: Load

```python
route_stop = client.RouteStop().load({"direction": "direction", "route": "route", "service_type": "service_type"})
```

#### Example: List

```python
route_stops = client.RouteStop().list()
```


### Stop

Create an instance: `stop = client.Stop()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `str` |  |
| `lat` | `str` | Latitude coordinate |
| `long` | `str` | Longitude coordinate |
| `name_en` | `str` | Stop name in English |
| `name_sc` | `str` | Stop name in Simplified Chinese |
| `name_tc` | `str` | Stop name in Traditional Chinese |
| `stop` | `str` | Stop identifier |

#### Example: Load

```python
stop = client.Stop().load({"id": "stop_id"})
```

#### Example: List

```python
stops = client.Stop().list()
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

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```python
stop = client.Stop()
stop.list()

# stop.data_get() now returns the stop data from the last list
# stop.match_get() returns the last match criteria
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
