# RealTimeBusData SDK configuration

module RealTimeBusDataConfig
  def self.make_config
    {
      "main" => {
        "name" => "RealTimeBusData",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://data.etabus.gov.hk",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "eta" => {},
          "route" => {},
          "route_stop" => {},
          "stop" => {},
        },
      },
      "entity" => {
        "eta" => {
          "fields" => [
            {
              "name" => "co",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "data",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "data_timestamp",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "dest_en",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "dest_sc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "dest_tc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "dir",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "eta",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "eta_seq",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "generated_timestamp",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 9,
            },
            {
              "name" => "rmk_en",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 10,
            },
            {
              "name" => "rmk_sc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 11,
            },
            {
              "name" => "rmk_tc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 12,
            },
            {
              "name" => "route",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 13,
            },
            {
              "name" => "seq",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 14,
            },
            {
              "name" => "service_type",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 15,
            },
            {
              "name" => "stop",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 16,
            },
            {
              "name" => "type",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 17,
            },
            {
              "name" => "version",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 18,
            },
          ],
          "name" => "eta",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "route",
                        "orig" => "route",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "service_type",
                        "orig" => "service_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "0000D01E8B5635F0",
                        "kind" => "param",
                        "name" => "stop_id",
                        "orig" => "stop_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "eta",
                    "{stop_id}",
                    "{route}",
                    "{service_type}",
                  ],
                  "select" => {
                    "exist" => [
                      "route",
                      "service_type",
                      "stop_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "route",
                        "orig" => "route",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "service_type",
                        "orig" => "service_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/route-eta/{route}/{service_type}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "route-eta",
                    "{route}",
                    "{service_type}",
                  ],
                  "select" => {
                    "exist" => [
                      "route",
                      "service_type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 1,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "0000D01E8B5635F0",
                        "kind" => "param",
                        "name" => "stop_id",
                        "orig" => "stop_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/stop-eta/{stop_id}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "stop-eta",
                    "{stop_id}",
                  ],
                  "select" => {
                    "exist" => [
                      "stop_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "eta",
              ],
              [
                "route_eta",
              ],
              [
                "stop_eta",
              ],
            ],
          },
        },
        "route" => {
          "fields" => [
            {
              "name" => "bound",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "data",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "dest_en",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "dest_sc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "dest_tc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "generated_timestamp",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "orig_en",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "orig_sc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "orig_tc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "route",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 9,
            },
            {
              "name" => "service_type",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 10,
            },
            {
              "name" => "type",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 11,
            },
            {
              "name" => "version",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 12,
            },
          ],
          "name" => "route",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/route",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "route",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "route",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/route/{route}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "route",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "route" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "route_stop" => {
          "fields" => [
            {
              "name" => "bound",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "route",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "seq",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "service_type",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "stop",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
          ],
          "name" => "route_stop",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "outbound",
                        "kind" => "param",
                        "name" => "direction",
                        "orig" => "direction",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "route",
                        "orig" => "route",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                      {
                        "example" => "1",
                        "kind" => "param",
                        "name" => "service_type",
                        "orig" => "service_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "route-stop",
                    "{route}",
                    "{direction}",
                    "{service_type}",
                  ],
                  "select" => {
                    "exist" => [
                      "direction",
                      "route",
                      "service_type",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
                {
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/route-stop",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "route-stop",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 1,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "route_stop",
              ],
            ],
          },
        },
        "stop" => {
          "fields" => [
            {
              "name" => "data",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "generated_timestamp",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "lat",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "long",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "name_en",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "name_sc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "name_tc",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "stop",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "type",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "version",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 9,
            },
          ],
          "name" => "stop",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/stop",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "stop",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "0000D01E8B5635F0",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "stop_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/v1/transport/kmb/stop/{stop_id}",
                  "parts" => [
                    "v1",
                    "transport",
                    "kmb",
                    "stop",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "stop_id" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    RealTimeBusDataFeatures.make_feature(name)
  end
end
