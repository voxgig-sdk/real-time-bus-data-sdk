# RealTimeBusData Python SDK Reference

Complete API reference for the RealTimeBusData Python SDK.


## RealTimeBusDataSDK

### Constructor

```python
from realtimebusdata_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `RealTimeBusDataSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = RealTimeBusDataSDK.test()
```


### Instance Methods

#### `Eta(data=None)`

Create a new `EtaEntity` instance. Pass `None` for no initial data.

#### `Route(data=None)`

Create a new `RouteEntity` instance. Pass `None` for no initial data.

#### `RouteStop(data=None)`

Create a new `RouteStopEntity` instance. Pass `None` for no initial data.

#### `Stop(data=None)`

Create a new `StopEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## EtaEntity

```python
eta = client.Eta()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `co` | `str` | No |  |
| `data` | `list` | No |  |
| `data_timestamp` | `str` | No |  |
| `dest_en` | `str` | No |  |
| `dest_sc` | `str` | No |  |
| `dest_tc` | `str` | No |  |
| `dir` | `str` | No |  |
| `eta` | `str` | No |  |
| `eta_seq` | `int` | No |  |
| `generated_timestamp` | `str` | No |  |
| `rmk_en` | `str` | No |  |
| `rmk_sc` | `str` | No |  |
| `rmk_tc` | `str` | No |  |
| `route` | `str` | No |  |
| `seq` | `int` | No |  |
| `service_type` | `int` | No |  |
| `stop` | `str` | No |  |
| `type` | `str` | No |  |
| `version` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Eta().list()
for eta in results:
    print(eta)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Eta().load({"stop_id": "stop_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EtaEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## RouteEntity

```python
route = client.Route()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `str` | No |  |
| `data` | `list` | No |  |
| `dest_en` | `str` | No |  |
| `dest_sc` | `str` | No |  |
| `dest_tc` | `str` | No |  |
| `generated_timestamp` | `str` | No |  |
| `orig_en` | `str` | No |  |
| `orig_sc` | `str` | No |  |
| `orig_tc` | `str` | No |  |
| `route` | `str` | No |  |
| `service_type` | `str` | No |  |
| `type` | `str` | No |  |
| `version` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Route().list()
for route in results:
    print(route)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Route().load({"id": "route_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## RouteStopEntity

```python
route_stop = client.RouteStop()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `str` | No |  |
| `route` | `str` | No |  |
| `seq` | `str` | No |  |
| `service_type` | `str` | No |  |
| `stop` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.RouteStop().list()
for route_stop in results:
    print(route_stop)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteStopEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## StopEntity

```python
stop = client.Stop()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `dict` | No |  |
| `generated_timestamp` | `str` | No |  |
| `lat` | `str` | No |  |
| `long` | `str` | No |  |
| `name_en` | `str` | No |  |
| `name_sc` | `str` | No |  |
| `name_tc` | `str` | No |  |
| `stop` | `str` | No |  |
| `type` | `str` | No |  |
| `version` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Stop().list()
for stop in results:
    print(stop)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Stop().load({"id": "stop_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `StopEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = RealTimeBusDataSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

