# RealTimeBusData Python SDK Reference

Complete API reference for the RealTimeBusData Python SDK.


## RealTimeBusDataSDK

### Constructor

```python
from real-time-bus-data_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
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

#### `direct(fetchargs=None) -> tuple`

Make a direct HTTP request to any API endpoint. Returns `(result, err)`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `(result_dict, err)`

#### `prepare(fetchargs=None) -> tuple`

Prepare a fetch definition without sending. Returns `(fetchdef, err)`.


---

## EtaEntity

```python
eta = client.Eta()
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.Eta().list({})
```

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Eta().load({"id": "eta_id"})
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.Route().list({})
```

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Route().load({"id": "route_id"})
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
| `bound` | ``$STRING`` | No |  |
| `route` | ``$STRING`` | No |  |
| `seq` | ``$STRING`` | No |  |
| `service_type` | ``$STRING`` | No |  |
| `stop` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.RouteStop().list({})
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.Stop().list({})
```

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Stop().load({"id": "stop_id"})
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

