# RealTimeBusData TypeScript SDK



The TypeScript SDK for the RealTimeBusData API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Eta()` — each with a small set of operations (`list`, `load`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
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

### 2. List eta records

`list()` resolves to an array of Eta ENTITIES — every operation
resolves to entities, not raw records. Iterate them directly, and call
`.data()` on one for the record it holds:

```ts
const etas = await client.Eta().list({ route: "example", service_type: "example" })

for (const eta of etas) {
  console.log(eta)
}
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
  const routes = await client.Route().list()
  console.log(routes)
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

const route = await client.Route().list()
// route is the entity, populated with mock response data
// — call route.data() for the record itself
console.log(route)
```

You can also use the instance method:

```ts
const client = new RealTimeBusDataSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Route()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
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

Operations: list, load.

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

Operations: list, load.

API path: `/v1/transport/kmb/route`

#### RouteStop

| Field | Description |
| --- | --- |
| `bound` |  |
| `route` |  |
| `seq` |  |
| `service_type` |  |
| `stop` |  |

Operations: list.

API path: `/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}`

#### Stop

| Field | Description |
| --- | --- |
| `lat` |  |
| `long` |  |
| `name_en` |  |
| `name_sc` |  |
| `name_tc` |  |
| `stop` |  |

Operations: list, load.

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
| `co` | `string` |  |
| `data` | `any[]` |  |
| `data_timestamp` | `string` |  |
| `dest_en` | `string` |  |
| `dest_sc` | `string` |  |
| `dest_tc` | `string` |  |
| `dir` | `string` |  |
| `eta` | `string` |  |
| `eta_seq` | `number` |  |
| `generated_timestamp` | `string` |  |
| `rmk_en` | `string` |  |
| `rmk_sc` | `string` |  |
| `rmk_tc` | `string` |  |
| `route` | `string` |  |
| `seq` | `number` |  |
| `service_type` | `number` |  |
| `stop` | `string` |  |
| `type` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```ts
const eta = await client.Eta().load({ stop_id: 'stop_id' })
```

#### Example: List

```ts
const etas = await client.Eta().list({ route: "example", service_type: "example" })
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
| `bound` | `string` |  |
| `data` | `any[]` |  |
| `dest_en` | `string` |  |
| `dest_sc` | `string` |  |
| `dest_tc` | `string` |  |
| `generated_timestamp` | `string` |  |
| `orig_en` | `string` |  |
| `orig_sc` | `string` |  |
| `orig_tc` | `string` |  |
| `route` | `string` |  |
| `service_type` | `string` |  |
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

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bound` | `string` |  |
| `route` | `string` |  |
| `seq` | `string` |  |
| `service_type` | `string` |  |
| `stop` | `string` |  |

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
| `lat` | `string` |  |
| `long` | `string` |  |
| `name_en` | `string` |  |
| `name_sc` | `string` |  |
| `name_tc` | `string` |  |
| `stop` | `string` |  |

#### Example: Load

```ts
const stop = await client.Stop().load({ id: 'stop_id' })
```

#### Example: List

```ts
const stops = await client.Stop().list()
```


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
const route = client.Route()
await route.list()

// route.data() now returns the route data from the last `list`
// route.match() returns the last match criteria
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
