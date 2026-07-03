<?php
declare(strict_types=1);

// RealTimeBusData SDK configuration

class RealTimeBusDataConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "RealTimeBusData",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://data.etabus.gov.hk",
                "auth" => [
                    "prefix" => "Bearer",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "eta" => [],
                    "route" => [],
                    "route_stop" => [],
                    "stop" => [],
                ],
            ],
            "entity" => [
        'eta' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'co',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
            [
              'active' => true,
              'name' => 'data',
              'req' => false,
              'type' => '`$ARRAY`',
              'index$' => 1,
            ],
            [
              'active' => true,
              'name' => 'data_timestamp',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 2,
            ],
            [
              'active' => true,
              'name' => 'dest_en',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 3,
            ],
            [
              'active' => true,
              'name' => 'dest_sc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 4,
            ],
            [
              'active' => true,
              'name' => 'dest_tc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 5,
            ],
            [
              'active' => true,
              'name' => 'dir',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 6,
            ],
            [
              'active' => true,
              'name' => 'eta',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 7,
            ],
            [
              'active' => true,
              'name' => 'eta_seq',
              'req' => false,
              'type' => '`$INTEGER`',
              'index$' => 8,
            ],
            [
              'active' => true,
              'name' => 'generated_timestamp',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 9,
            ],
            [
              'active' => true,
              'name' => 'rmk_en',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 10,
            ],
            [
              'active' => true,
              'name' => 'rmk_sc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 11,
            ],
            [
              'active' => true,
              'name' => 'rmk_tc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 12,
            ],
            [
              'active' => true,
              'name' => 'route',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 13,
            ],
            [
              'active' => true,
              'name' => 'seq',
              'req' => false,
              'type' => '`$INTEGER`',
              'index$' => 14,
            ],
            [
              'active' => true,
              'name' => 'service_type',
              'req' => false,
              'type' => '`$INTEGER`',
              'index$' => 15,
            ],
            [
              'active' => true,
              'name' => 'stop',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 16,
            ],
            [
              'active' => true,
              'name' => 'type',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 17,
            ],
            [
              'active' => true,
              'name' => 'version',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 18,
            ],
          ],
          'name' => 'eta',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'route',
                        'orig' => 'route',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'service_type',
                        'orig' => 'service_type',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                      [
                        'active' => true,
                        'example' => '0000D01E8B5635F0',
                        'kind' => 'param',
                        'name' => 'stop_id',
                        'orig' => 'stop_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'eta',
                    '{stop_id}',
                    '{route}',
                    '{service_type}',
                  ],
                  'select' => [
                    'exist' => [
                      'route',
                      'service_type',
                      'stop_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'route',
                        'orig' => 'route',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'service_type',
                        'orig' => 'service_type',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/route-eta/{route}/{service_type}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'route-eta',
                    '{route}',
                    '{service_type}',
                  ],
                  'select' => [
                    'exist' => [
                      'route',
                      'service_type',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 1,
                ],
              ],
              'key$' => 'list',
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => '0000D01E8B5635F0',
                        'kind' => 'param',
                        'name' => 'stop_id',
                        'orig' => 'stop_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/stop-eta/{stop_id}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'stop-eta',
                    '{stop_id}',
                  ],
                  'select' => [
                    'exist' => [
                      'stop_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [
              [
                'eta',
              ],
              [
                'route_eta',
              ],
              [
                'stop_eta',
              ],
            ],
          ],
        ],
        'route' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'bound',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
            [
              'active' => true,
              'name' => 'data',
              'req' => false,
              'type' => '`$ARRAY`',
              'index$' => 1,
            ],
            [
              'active' => true,
              'name' => 'dest_en',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 2,
            ],
            [
              'active' => true,
              'name' => 'dest_sc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 3,
            ],
            [
              'active' => true,
              'name' => 'dest_tc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 4,
            ],
            [
              'active' => true,
              'name' => 'generated_timestamp',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 5,
            ],
            [
              'active' => true,
              'name' => 'orig_en',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 6,
            ],
            [
              'active' => true,
              'name' => 'orig_sc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 7,
            ],
            [
              'active' => true,
              'name' => 'orig_tc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 8,
            ],
            [
              'active' => true,
              'name' => 'route',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 9,
            ],
            [
              'active' => true,
              'name' => 'service_type',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 10,
            ],
            [
              'active' => true,
              'name' => 'type',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 11,
            ],
            [
              'active' => true,
              'name' => 'version',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 12,
            ],
          ],
          'name' => 'route',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/route',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'route',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'list',
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'route',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/route/{route}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'route',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'route' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'route_stop' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'bound',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
            [
              'active' => true,
              'name' => 'route',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 1,
            ],
            [
              'active' => true,
              'name' => 'seq',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 2,
            ],
            [
              'active' => true,
              'name' => 'service_type',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 3,
            ],
            [
              'active' => true,
              'name' => 'stop',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 4,
            ],
          ],
          'name' => 'route_stop',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => 'outbound',
                        'kind' => 'param',
                        'name' => 'direction',
                        'orig' => 'direction',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'route',
                        'orig' => 'route',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                      [
                        'active' => true,
                        'example' => '1',
                        'kind' => 'param',
                        'name' => 'service_type',
                        'orig' => 'service_type',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/route-stop/{route}/{direction}/{service_type}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'route-stop',
                    '{route}',
                    '{direction}',
                    '{service_type}',
                  ],
                  'select' => [
                    'exist' => [
                      'direction',
                      'route',
                      'service_type',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/route-stop',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'route-stop',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 1,
                ],
              ],
              'key$' => 'list',
            ],
          ],
          'relations' => [
            'ancestors' => [
              [
                'route_stop',
              ],
            ],
          ],
        ],
        'stop' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'data',
              'req' => false,
              'type' => '`$OBJECT`',
              'index$' => 0,
            ],
            [
              'active' => true,
              'name' => 'generated_timestamp',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 1,
            ],
            [
              'active' => true,
              'name' => 'lat',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 2,
            ],
            [
              'active' => true,
              'name' => 'long',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 3,
            ],
            [
              'active' => true,
              'name' => 'name_en',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 4,
            ],
            [
              'active' => true,
              'name' => 'name_sc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 5,
            ],
            [
              'active' => true,
              'name' => 'name_tc',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 6,
            ],
            [
              'active' => true,
              'name' => 'stop',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 7,
            ],
            [
              'active' => true,
              'name' => 'type',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 8,
            ],
            [
              'active' => true,
              'name' => 'version',
              'req' => false,
              'type' => '`$STRING`',
              'index$' => 9,
            ],
          ],
          'name' => 'stop',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/stop',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'stop',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'list',
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [
                    'params' => [
                      [
                        'active' => true,
                        'example' => '0000D01E8B5635F0',
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'stop_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/v1/transport/kmb/stop/{stop_id}',
                  'parts' => [
                    'v1',
                    'transport',
                    'kmb',
                    'stop',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'stop_id' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return RealTimeBusDataFeatures::make_feature($name);
    }
}
