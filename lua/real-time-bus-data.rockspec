package = "voxgig-sdk-real-time-bus-data"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/real-time-bus-data-sdk.git",
  tag = "lua/v0.0.1",
  dir = "real-time-bus-data-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the Real Time Bus Data public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/real-time-bus-data-sdk",
  issues_url = "https://github.com/voxgig-sdk/real-time-bus-data-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "real-time-bus-data" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["real-time-bus-data_sdk"] = "real-time-bus-data_sdk.lua",
    ["config"] = "config.lua",
    ["config_shared"] = "config_shared.lua",
    ["features"] = "features.lua",
  }
}
