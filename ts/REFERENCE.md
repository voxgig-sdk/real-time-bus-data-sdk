# RealTimeBusData TypeScript SDK Reference

Complete API reference for the RealTimeBusData TypeScript SDK.


## RealTimeBusDataSDK

### Constructor

```ts
new RealTimeBusDataSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `RealTimeBusDataSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = RealTimeBusDataSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `RealTimeBusDataSDK` instance in test mode.


### Instance Methods

#### `Eta(data?: object)`

Create a new `Eta` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `EtaEntity` instance.

#### `Route(data?: object)`

Create a new `Route` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `RouteEntity` instance.

#### `RouteStop(data?: object)`

Create a new `RouteStop` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `RouteStopEntity` instance.

#### `Stop(data?: object)`

Create a new `Stop` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `StopEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `RealTimeBusDataSDK.test()`.

**Returns:** `RealTimeBusDataSDK` instance in test mode.


---

## EtaEntity

```ts
const eta = client.Eta()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `any[]` | No |  |
| `generated_timestamp` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Eta().load({ stop_id: 'stop_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `EtaEntity` instance with the same client and
options.

#### `client()`

Return the parent `RealTimeBusDataSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## RouteEntity

```ts
const route = client.Route()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No | Direction of the route |
| `data` | `any[]` | No |  |
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Route().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Route().load({ id: 'route_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `RouteEntity` instance with the same client and
options.

#### `client()`

Return the parent `RealTimeBusDataSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## RouteStopEntity

```ts
const route_stop = client.RouteStop()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bound` | `string` | No | Direction of the route |
| `data` | `any[]` | No |  |
| `generated_timestamp` | `string` | No |  |
| `route` | `string` | No | Route number |
| `seq` | `string` | No | Stop sequence number on the route |
| `service_type` | `string` | No | Service type identifier |
| `stop` | `string` | No | Stop identifier |
| `type` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.RouteStop().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.RouteStop().load({ direction: 'direction', route: 'route', service_type: 'service_type' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `RouteStopEntity` instance with the same client and
options.

#### `client()`

Return the parent `RealTimeBusDataSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## StopEntity

```ts
const stop = client.Stop()
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Stop().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Stop().load({ id: 'stop_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `StopEntity` instance with the same client and
options.

#### `client()`

Return the parent `RealTimeBusDataSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new RealTimeBusDataSDK({
  feature: {
    test: { active: true },
  }
})
```

