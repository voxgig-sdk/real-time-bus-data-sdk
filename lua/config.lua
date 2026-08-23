-- RealTimeBusData SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "RealTimeBusData",
      slug = "real-time-bus-data",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://data.etabus.gov.hk",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["eta"] = {},
        ["route"] = {},
        ["route_stop"] = {},
        ["stop"] = {},
      },
    },
    entity = {
      ["eta"] = {
        ["fields"] = {
          {
            ["name"] = "data",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "generated_timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "type",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "version",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "eta",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "route",
                      ["orig"] = "route",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "service_type",
                      ["orig"] = "service_type",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "0000D01E8B5635F0",
                      ["kind"] = "param",
                      ["name"] = "stop_id",
                      ["orig"] = "stop_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "eta",
                  "{stop_id}",
                  "{route}",
                  "{service_type}",
                },
                ["select"] = {
                  ["exist"] = {
                    "route",
                    "service_type",
                    "stop_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "route",
                      ["orig"] = "route",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "service_type",
                      ["orig"] = "service_type",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/route-eta/{route}/{service_type}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "route-eta",
                  "{route}",
                  "{service_type}",
                },
                ["select"] = {
                  ["exist"] = {
                    "route",
                    "service_type",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "0000D01E8B5635F0",
                      ["kind"] = "param",
                      ["name"] = "stop_id",
                      ["orig"] = "stop_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/stop-eta/{stop_id}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "stop-eta",
                  "{stop_id}",
                },
                ["select"] = {
                  ["exist"] = {
                    "stop_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "eta",
            },
            {
              "route_eta",
            },
            {
              "stop_eta",
            },
          },
        },
      },
      ["route"] = {
        ["fields"] = {
          {
            ["name"] = "bound",
            ["short"] = "Direction of the route",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "data",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "dest_en",
            ["short"] = "Destination stop name in English",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "dest_sc",
            ["short"] = "Destination stop name in Simplified Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "dest_tc",
            ["short"] = "Destination stop name in Traditional Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "generated_timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "orig_en",
            ["short"] = "Origin stop name in English",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "orig_sc",
            ["short"] = "Origin stop name in Simplified Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "orig_tc",
            ["short"] = "Origin stop name in Traditional Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "route",
            ["short"] = "Route number",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "service_type",
            ["short"] = "Service type identifier",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "type",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "version",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "route",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/route",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "route",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "route",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/route/{route}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "route",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["route"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["route_stop"] = {
        ["fields"] = {
          {
            ["name"] = "bound",
            ["short"] = "Direction of the route",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "data",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "generated_timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "route",
            ["short"] = "Route number",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "seq",
            ["short"] = "Stop sequence number on the route",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "service_type",
            ["short"] = "Service type identifier",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "stop",
            ["short"] = "Stop identifier",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "type",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "version",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "route_stop",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/route-stop",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "route-stop",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "outbound",
                      ["kind"] = "param",
                      ["name"] = "direction",
                      ["orig"] = "direction",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "route",
                      ["orig"] = "route",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "1",
                      ["kind"] = "param",
                      ["name"] = "service_type",
                      ["orig"] = "service_type",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "route-stop",
                  "{route}",
                  "{direction}",
                  "{service_type}",
                },
                ["select"] = {
                  ["exist"] = {
                    "direction",
                    "route",
                    "service_type",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "route_stop",
            },
          },
        },
      },
      ["stop"] = {
        ["fields"] = {
          {
            ["name"] = "lat",
            ["short"] = "Latitude coordinate",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "long",
            ["short"] = "Longitude coordinate",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name_en",
            ["short"] = "Stop name in English",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name_sc",
            ["short"] = "Stop name in Simplified Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name_tc",
            ["short"] = "Stop name in Traditional Chinese",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "stop",
            ["short"] = "Stop identifier",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "stop",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/stop",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "stop",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["example"] = "0000D01E8B5635F0",
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "stop_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v1/transport/kmb/stop/{stop_id}",
                ["parts"] = {
                  "v1",
                  "transport",
                  "kmb",
                  "stop",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["stop_id"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.data`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
