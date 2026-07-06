<?php
declare(strict_types=1);

// Typed models for the RealTimeBusData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Eta entity data model. */
class Eta
{
    public ?string $co = null;
    public ?array $data = null;
    public ?string $data_timestamp = null;
    public ?string $dest_en = null;
    public ?string $dest_sc = null;
    public ?string $dest_tc = null;
    public ?string $dir = null;
    public ?string $eta = null;
    public ?int $eta_seq = null;
    public ?string $generated_timestamp = null;
    public ?string $rmk_en = null;
    public ?string $rmk_sc = null;
    public ?string $rmk_tc = null;
    public ?string $route = null;
    public ?int $seq = null;
    public ?int $service_type = null;
    public ?string $stop = null;
    public ?string $type = null;
    public ?string $version = null;
}

/** Request payload for Eta#load. */
class EtaLoadMatch
{
    public string $stop_id;
}

/** Request payload for Eta#list. */
class EtaListMatch
{
    public string $route;
    public string $service_type;
    public string $stop_id;
}

/** Route entity data model. */
class Route
{
    public ?string $bound = null;
    public ?array $data = null;
    public ?string $dest_en = null;
    public ?string $dest_sc = null;
    public ?string $dest_tc = null;
    public ?string $generated_timestamp = null;
    public ?string $orig_en = null;
    public ?string $orig_sc = null;
    public ?string $orig_tc = null;
    public ?string $route = null;
    public ?string $service_type = null;
    public ?string $type = null;
    public ?string $version = null;
}

/** Request payload for Route#load. */
class RouteLoadMatch
{
    public string $id;
}

/** Request payload for Route#list. */
class RouteListMatch
{
    public ?string $bound = null;
    public ?array $data = null;
    public ?string $dest_en = null;
    public ?string $dest_sc = null;
    public ?string $dest_tc = null;
    public ?string $generated_timestamp = null;
    public ?string $orig_en = null;
    public ?string $orig_sc = null;
    public ?string $orig_tc = null;
    public ?string $route = null;
    public ?string $service_type = null;
    public ?string $type = null;
    public ?string $version = null;
}

/** RouteStop entity data model. */
class RouteStop
{
    public ?string $bound = null;
    public ?string $route = null;
    public ?string $seq = null;
    public ?string $service_type = null;
    public ?string $stop = null;
}

/** Request payload for RouteStop#list. */
class RouteStopListMatch
{
    public string $direction;
    public string $route;
    public string $service_type;
}

/** Stop entity data model. */
class Stop
{
    public ?array $data = null;
    public ?string $generated_timestamp = null;
    public ?string $lat = null;
    public ?string $long = null;
    public ?string $name_en = null;
    public ?string $name_sc = null;
    public ?string $name_tc = null;
    public ?string $stop = null;
    public ?string $type = null;
    public ?string $version = null;
}

/** Request payload for Stop#load. */
class StopLoadMatch
{
    public string $id;
}

/** Request payload for Stop#list. */
class StopListMatch
{
    public ?array $data = null;
    public ?string $generated_timestamp = null;
    public ?string $lat = null;
    public ?string $long = null;
    public ?string $name_en = null;
    public ?string $name_sc = null;
    public ?string $name_tc = null;
    public ?string $stop = null;
    public ?string $type = null;
    public ?string $version = null;
}

