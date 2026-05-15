<?php
declare(strict_types=1);

// Eta entity test

require_once __DIR__ . '/../realtimebusdata_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class EtaEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = RealTimeBusDataSDK::test(null, null);
        $ent = $testsdk->Eta(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = eta_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["list", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "eta." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set REALTIMEBUSDATA_TEST_ETA_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $eta_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.eta")));
        $eta_ref01_data = null;
        if (count($eta_ref01_data_raw) > 0) {
            $eta_ref01_data = Helpers::to_map($eta_ref01_data_raw[0][1]);
        }

        // LIST
        $eta_ref01_ent = $client->Eta(null);
        $eta_ref01_match = [
            "route" => $setup["idmap"]["route01"],
            "service_type" => $setup["idmap"]["service_type01"],
        ];

        [$eta_ref01_list_result, $err] = $eta_ref01_ent->list($eta_ref01_match, null);
        $this->assertNull($err);
        $this->assertIsArray($eta_ref01_list_result);

        // LOAD
        $eta_ref01_match_dt0 = [];
        [$eta_ref01_data_dt0_loaded, $err] = $eta_ref01_ent->load($eta_ref01_match_dt0, null);
        $this->assertNull($err);
        $this->assertNotNull($eta_ref01_data_dt0_loaded);

    }
}

function eta_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/eta/EtaTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = RealTimeBusDataSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["eta01", "eta02", "eta03", "route_eta01", "route_eta02", "route_eta03", "stop_eta01", "stop_eta02", "stop_eta03", "route01", "service_type01"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("REALTIMEBUSDATA_TEST_ETA_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "REALTIMEBUSDATA_TEST_ETA_ENTID" => $idmap,
        "REALTIMEBUSDATA_TEST_LIVE" => "FALSE",
        "REALTIMEBUSDATA_TEST_EXPLAIN" => "FALSE",
        "REALTIMEBUSDATA_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["REALTIMEBUSDATA_TEST_ETA_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["REALTIMEBUSDATA_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["REALTIMEBUSDATA_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new RealTimeBusDataSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["REALTIMEBUSDATA_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["REALTIMEBUSDATA_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
