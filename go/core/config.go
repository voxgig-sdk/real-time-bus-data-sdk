package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "RealTimeBusData",
			"slug": "real-time-bus-data",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://data.etabus.gov.hk",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"eta": map[string]any{},
				"route": map[string]any{},
				"route_stop": map[string]any{},
				"stop": map[string]any{},
			},
		},
		"entity": map[string]any{
			"eta": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "data",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "generated_timestamp",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$STRING`",
					},
				},
				"name": "eta",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "route",
											"orig": "route",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "service_type",
											"orig": "service_type",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "0000D01E8B5635F0",
											"kind": "param",
											"name": "stop_id",
											"orig": "stop_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"eta",
									"{stop_id}",
									"{route}",
									"{service_type}",
								},
								"select": map[string]any{
									"exist": []any{
										"route",
										"service_type",
										"stop_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "route",
											"orig": "route",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "service_type",
											"orig": "service_type",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/route-eta/{route}/{service_type}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"route-eta",
									"{route}",
									"{service_type}",
								},
								"select": map[string]any{
									"exist": []any{
										"route",
										"service_type",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "0000D01E8B5635F0",
											"kind": "param",
											"name": "stop_id",
											"orig": "stop_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/stop-eta/{stop_id}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"stop-eta",
									"{stop_id}",
								},
								"select": map[string]any{
									"exist": []any{
										"stop_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"eta",
						},
						[]any{
							"route_eta",
						},
						[]any{
							"stop_eta",
						},
					},
				},
			},
			"route": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "bound",
						"short": "Direction of the route",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "data",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "dest_en",
						"short": "Destination stop name in English",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dest_sc",
						"short": "Destination stop name in Simplified Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "dest_tc",
						"short": "Destination stop name in Traditional Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "generated_timestamp",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "orig_en",
						"short": "Origin stop name in English",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "orig_sc",
						"short": "Origin stop name in Simplified Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "orig_tc",
						"short": "Origin stop name in Traditional Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "route",
						"short": "Route number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "service_type",
						"short": "Service type identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$STRING`",
					},
				},
				"name": "route",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/route",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"route",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "id",
											"orig": "route",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/route/{route}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"route",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"route": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"route_stop": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "bound",
						"short": "Direction of the route",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "data",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "generated_timestamp",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "route",
						"short": "Route number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "seq",
						"short": "Stop sequence number on the route",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "service_type",
						"short": "Service type identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "stop",
						"short": "Stop identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"type": "`$STRING`",
					},
				},
				"name": "route_stop",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/route-stop",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"route-stop",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "outbound",
											"kind": "param",
											"name": "direction",
											"orig": "direction",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "route",
											"orig": "route",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "1",
											"kind": "param",
											"name": "service_type",
											"orig": "service_type",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"route-stop",
									"{route}",
									"{direction}",
									"{service_type}",
								},
								"select": map[string]any{
									"exist": []any{
										"direction",
										"route",
										"service_type",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"route_stop",
						},
					},
				},
			},
			"stop": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "lat",
						"short": "Latitude coordinate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "long",
						"short": "Longitude coordinate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name_en",
						"short": "Stop name in English",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name_sc",
						"short": "Stop name in Simplified Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name_tc",
						"short": "Stop name in Traditional Chinese",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "stop",
						"short": "Stop identifier",
						"type": "`$STRING`",
					},
				},
				"name": "stop",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/stop",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"stop",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": "0000D01E8B5635F0",
											"kind": "param",
											"name": "id",
											"orig": "stop_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v1/transport/kmb/stop/{stop_id}",
								"parts": []any{
									"v1",
									"transport",
									"kmb",
									"stop",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"stop_id": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
