# RouteStop entity test

require "minitest/autorun"
require "json"
require_relative "../RealTimeBusData_sdk"
require_relative "runner"

class RouteStopEntityTest < Minitest::Test
  def test_create_instance
    testsdk = RealTimeBusDataSDK.test(nil, nil)
    ent = testsdk.RouteStop(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = route_stop_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["list"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "route_stop." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set REALTIMEBUSDATA_TEST_ROUTE_STOP_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    route_stop_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.route_stop")))
    route_stop_ref01_data = nil
    if route_stop_ref01_data_raw.length > 0
      route_stop_ref01_data = Helpers.to_map(route_stop_ref01_data_raw[0][1])
    end

    # LIST
    route_stop_ref01_ent = client.RouteStop(nil)
    route_stop_ref01_match = {}

    route_stop_ref01_list_result, err = route_stop_ref01_ent.list(route_stop_ref01_match, nil)
    assert_nil err
    assert route_stop_ref01_list_result.is_a?(Array)

  end
end

def route_stop_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "route_stop", "RouteStopTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = RealTimeBusDataSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["route_stop01", "route_stop02", "route_stop03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["REALTIMEBUSDATA_TEST_ROUTE_STOP_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "REALTIMEBUSDATA_TEST_ROUTE_STOP_ENTID" => idmap,
    "REALTIMEBUSDATA_TEST_LIVE" => "FALSE",
    "REALTIMEBUSDATA_TEST_EXPLAIN" => "FALSE",
    "REALTIMEBUSDATA_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["REALTIMEBUSDATA_TEST_ROUTE_STOP_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["REALTIMEBUSDATA_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["REALTIMEBUSDATA_APIKEY"],
      },
      extra || {},
    ])
    client = RealTimeBusDataSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["REALTIMEBUSDATA_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["REALTIMEBUSDATA_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
