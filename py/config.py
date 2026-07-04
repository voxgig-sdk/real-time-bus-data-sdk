# RealTimeBusData SDK configuration


def make_config():
    return {
        "main": {
            "name": "RealTimeBusData",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://data.etabus.gov.hk",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "eta": {},
                "route": {},
                "route_stop": {},
                "stop": {},
            },
        },
        "entity": {
      "eta": {
        "fields": [
          {
            "active": True,
            "name": "co",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "data",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "data_timestamp",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "dest_en",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "dest_sc",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "dest_tc",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "dir",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "eta",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "eta_seq",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "generated_timestamp",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "rmk_en",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "rmk_sc",
            "req": False,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "rmk_tc",
            "req": False,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "route",
            "req": False,
            "type": "`$STRING`",
            "index$": 13,
          },
          {
            "active": True,
            "name": "seq",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 14,
          },
          {
            "active": True,
            "name": "service_type",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 15,
          },
          {
            "active": True,
            "name": "stop",
            "req": False,
            "type": "`$STRING`",
            "index$": 16,
          },
          {
            "active": True,
            "name": "type",
            "req": False,
            "type": "`$STRING`",
            "index$": 17,
          },
          {
            "active": True,
            "name": "version",
            "req": False,
            "type": "`$STRING`",
            "index$": 18,
          },
        ],
        "name": "eta",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "route",
                      "orig": "route",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "service_type",
                      "orig": "service_type",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                    {
                      "active": True,
                      "example": "0000D01E8B5635F0",
                      "kind": "param",
                      "name": "stop_id",
                      "orig": "stop_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 2,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "eta",
                  "{stop_id}",
                  "{route}",
                  "{service_type}",
                ],
                "select": {
                  "exist": [
                    "route",
                    "service_type",
                    "stop_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "route",
                      "orig": "route",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "service_type",
                      "orig": "service_type",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/route-eta/{route}/{service_type}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "route-eta",
                  "{route}",
                  "{service_type}",
                ],
                "select": {
                  "exist": [
                    "route",
                    "service_type",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "0000D01E8B5635F0",
                      "kind": "param",
                      "name": "stop_id",
                      "orig": "stop_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/stop-eta/{stop_id}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "stop-eta",
                  "{stop_id}",
                ],
                "select": {
                  "exist": [
                    "stop_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
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
      "route": {
        "fields": [
          {
            "active": True,
            "name": "bound",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "data",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "dest_en",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "dest_sc",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "dest_tc",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "generated_timestamp",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "orig_en",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "orig_sc",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "orig_tc",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "route",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "service_type",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "type",
            "req": False,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "version",
            "req": False,
            "type": "`$STRING`",
            "index$": 12,
          },
        ],
        "name": "route",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/v1/transport/kmb/route",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "route",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "id",
                      "orig": "route",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/route/{route}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "route",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "route": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "route_stop": {
        "fields": [
          {
            "active": True,
            "name": "bound",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "route",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "seq",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "service_type",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "stop",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
        ],
        "name": "route_stop",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "outbound",
                      "kind": "param",
                      "name": "direction",
                      "orig": "direction",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "route",
                      "orig": "route",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 1,
                    },
                    {
                      "active": True,
                      "example": "1",
                      "kind": "param",
                      "name": "service_type",
                      "orig": "service_type",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 2,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "route-stop",
                  "{route}",
                  "{direction}",
                  "{service_type}",
                ],
                "select": {
                  "exist": [
                    "direction",
                    "route",
                    "service_type",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/v1/transport/kmb/route-stop",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "route-stop",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 1,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [
            [
              "route_stop",
            ],
          ],
        },
      },
      "stop": {
        "fields": [
          {
            "active": True,
            "name": "data",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "generated_timestamp",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "lat",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "long",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "name_en",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "name_sc",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "name_tc",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "stop",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "type",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "version",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
        ],
        "name": "stop",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/v1/transport/kmb/stop",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "stop",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "params": [
                    {
                      "active": True,
                      "example": "0000D01E8B5635F0",
                      "kind": "param",
                      "name": "id",
                      "orig": "stop_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v1/transport/kmb/stop/{stop_id}",
                "parts": [
                  "v1",
                  "transport",
                  "kmb",
                  "stop",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "stop_id": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
