# RealTimeBusData SDK

Real-time arrival estimates for Hong Kong's KMB and Long Win bus services

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Real Time Bus Data

This SDK wraps the public real-time bus ETA API hosted at [data.etabus.gov.hk](https://data.etabus.gov.hk). The service is provided by [Kowloon Motor Bus](https://www.kmb.hk/) (KMB) and [Long Win Bus](https://www.lwb.hk/) (LWB) and is distributed through Hong Kong's open data programme at [data.gov.hk](https://data.gov.hk/en-data/dataset/hk-td-tis_21-etakmb).

What you get from the API:

- Full list of bus routes operated by KMB and LWB
- Full list of bus stops with identifiers and location data
- Route-stop mappings describing the stop sequence for each route, direction and service type
- Estimated time of arrival (ETA) for buses at a stop, by route, or by stop-and-route combination

Responses are JSON. According to the data.gov.hk dataset page, ETA data is refreshed approximately every minute, while route and stop reference data is updated daily. The API is open and does not require authentication, and CORS is reported as enabled by community catalogues. Rate limits are not documented on the dataset page.

## Try it

**TypeScript**
```bash
npm install real-time-bus-data
```

**Python**
```bash
pip install real-time-bus-data-sdk
```

**PHP**
```bash
composer require voxgig/real-time-bus-data-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/real-time-bus-data-sdk/go
```

**Ruby**
```bash
gem install real-time-bus-data-sdk
```

**Lua**
```bash
luarocks install real-time-bus-data-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { RealTimeBusDataSDK } from 'real-time-bus-data'

const client = new RealTimeBusDataSDK({})

// List all etas
const etas = await client.Eta().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o real-time-bus-data-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "real-time-bus-data": {
      "command": "/abs/path/to/real-time-bus-data-mcp"
    }
  }
}
```

## Entities

The API exposes 4 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Eta** | Real-time estimated arrival times for buses; accessible via `/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}`, `/v1/transport/kmb/stop-eta/{stop_id}` (all ETAs at a stop) and `/v1/transport/kmb/route-eta/{route}/{service_type}` (all ETAs along a route). | `/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}` |
| **Route** | A KMB or LWB bus route, including origin and destination; listed at `/v1/transport/kmb/route/` and detailed at `/v1/transport/kmb/route/{route}/{direction}/{service_type}`. | `/v1/transport/kmb/route` |
| **RouteStop** | The ordered mapping of stops along a given route, direction and service type; available at `/v1/transport/kmb/route-stop` and `/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}`. | `/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}` |
| **Stop** | A physical bus stop with identifier and location; listed at `/v1/transport/kmb/stop` and detailed at `/v1/transport/kmb/stop/{stop_id}`. | `/v1/transport/kmb/stop` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from realtimebusdata_sdk import RealTimeBusDataSDK

client = RealTimeBusDataSDK({})

# List all etas
etas, err = client.Eta(None).list(None, None)

# Load a specific eta
eta, err = client.Eta(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'realtimebusdata_sdk.php';

$client = new RealTimeBusDataSDK([]);

// List all etas
[$etas, $err] = $client->Eta(null)->list(null, null);

// Load a specific eta
[$eta, $err] = $client->Eta(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/real-time-bus-data-sdk/go"

client := sdk.NewRealTimeBusDataSDK(map[string]any{})

// List all etas
etas, err := client.Eta(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "RealTimeBusData_sdk"

client = RealTimeBusDataSDK.new({})

# List all etas
etas, err = client.Eta(nil).list(nil, nil)

# Load a specific eta
eta, err = client.Eta(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("real-time-bus-data_sdk")

local client = sdk.new({})

-- List all etas
local etas, err = client:Eta(nil):list(nil, nil)

-- Load a specific eta
local eta, err = client:Eta(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = RealTimeBusDataSDK.test()
const result = await client.Eta().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = RealTimeBusDataSDK.test(None, None)
result, err = client.Eta(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = RealTimeBusDataSDK::test(null, null);
[$result, $err] = $client->Eta(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Eta(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = RealTimeBusDataSDK.test(nil, nil)
result, err = client.Eta(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Eta(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Real Time Bus Data

- Upstream: [https://data.etabus.gov.hk](https://data.etabus.gov.hk)
- API docs: [https://data.gov.hk/en-data/dataset/hk-td-tis_21-etakmb](https://data.gov.hk/en-data/dataset/hk-td-tis_21-etakmb)

- Dataset published through the Hong Kong government open data portal at [data.gov.hk](https://data.gov.hk/en-data/dataset/hk-td-tis_21-etakmb)
- Raw data is owned by Kowloon Motor Bus Company (1933) Limited (KMB) and Long Win Bus Company Limited (LWB)
- Check the dataset page for the current terms and conditions before redistributing or using commercially
- No licence text is published on the API server itself; treat undocumented details (rate limits, SLAs) as unspecified

---

Generated from the Real Time Bus Data OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
