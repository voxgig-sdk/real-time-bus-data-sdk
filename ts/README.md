# RealTimeBusData TypeScript SDK



The TypeScript SDK for the RealTimeBusData API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Eta()` — each with a small set of operations (`list`, `load`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Also generated from this model: `go`, `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb` — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases](https://github.com/voxgig-sdk/real-time-bus-data-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { RealTimeBusDataSDK } from '@voxgig-sdk/real-time-bus-data'

const client = new RealTimeBusDataSDK()
```

### 3. Load an eta

Eta is nested under stop, so provide the `stop_id`.
`load()` returns the entity directly and throws on failure:

```ts
try {
  const eta = await client.Eta().load({
    stop_id: 'example_stop_id',
  })
  console.log(eta)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const stops = await client.Stop().list()
  console.log(stops)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = RealTimeBusDataSDK.test()

const stop = await client.Stop().list()
// stop is the entity, populated with mock response data
// — call stop.data() for the record itself
console.log(stop)
```

You can also use the instance method:

```ts
const client = new RealTimeBusDataSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Stop()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data.id)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new RealTimeBusDataSDK({
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
REAL_TIME_BUS_DATA_TEST_LIVE=TRUE
```

Then run:

```bash
cd ts && npm test
```


## Reference

### RealTimeBusDataSDK

#### Constructor

```ts
new RealTimeBusDataSDK(options?: {
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Eta(data?)` | `EtaEntity` | Create an Eta entity instance. |
| `Route(data?)` | `RouteEntity` | Create a Route entity instance. |
| `RouteStop(data?)` | `RouteStopEntity` | Create a RouteStop entity instance. |
| `Stop(data?)` | `StopEntity` | Create a Stop entity instance. |
| `tester(testopts?, sdkopts?)` | `RealTimeBusDataSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `RealTimeBusDataSDK.test(testopts?, sdkopts?)` | `RealTimeBusDataSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): RealTimeBusDataSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` resolves to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

### Entities

#### Eta

| Field | Description |
| --- | --- |
| `data` |  |
| `generated_timestamp` |  |
| `type` |  |
| `version` |  |

Operations: load.

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

Operations: list, load.

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

Operations: list, load.

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

Operations: list, load.

API path: `/v1/transport/kmb/stop`



## Entities


### Eta

Create an instance: `const eta = client.Eta()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `any[]` |  |
| `generated_timestamp` | `string` |  |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```ts
const eta = await client.Eta().load({ stop_id: 'stop_id' })
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
| `bound` | `string` | Direction of the route |
| `data` | `any[]` |  |
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
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` | Direction of the route |
| `data` | `any[]` |  |
| `generated_timestamp` | `string` |  |
| `route` | `string` | Route number |
| `seq` | `string` | Stop sequence number on the route |
| `service_type` | `string` | Service type identifier |
| `stop` | `string` | Stop identifier |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```ts
const route_stop = await client.RouteStop().load({ direction: 'direction', route: 'route', service_type: 'service_type' })
```

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
| `id` | `string` |  |
| `lat` | `string` | Latitude coordinate |
| `long` | `string` | Longitude coordinate |
| `name_en` | `string` | Stop name in English |
| `name_sc` | `string` | Stop name in Simplified Chinese |
| `name_tc` | `string` | Stop name in Traditional Chinese |
| `stop` | `string` | Stop identifier |

#### Example: Load

```ts
const stop = await client.Stop().load({ id: 'stop_id' })
```

#### Example: List

```ts
const stops = await client.Stop().list()
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
real-time-bus-data/
├── src/
│   ├── RealTimeBusDataSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { RealTimeBusDataSDK } from '@voxgig-sdk/real-time-bus-data'
```

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const stop = client.Stop()
await stop.list()

// stop.data() now returns the stop data from the last `list`
// stop.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
