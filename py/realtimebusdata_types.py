# Typed models for the RealTimeBusData SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Eta:
    co: Optional[str] = None
    data: Optional[list] = None
    data_timestamp: Optional[str] = None
    dest_en: Optional[str] = None
    dest_sc: Optional[str] = None
    dest_tc: Optional[str] = None
    dir: Optional[str] = None
    eta: Optional[str] = None
    eta_seq: Optional[int] = None
    generated_timestamp: Optional[str] = None
    rmk_en: Optional[str] = None
    rmk_sc: Optional[str] = None
    rmk_tc: Optional[str] = None
    route: Optional[str] = None
    seq: Optional[int] = None
    service_type: Optional[int] = None
    stop: Optional[str] = None
    type: Optional[str] = None
    version: Optional[str] = None


@dataclass
class EtaLoadMatch:
    stop_id: str


@dataclass
class EtaListMatch:
    route: str
    service_type: str
    stop_id: str


@dataclass
class Route:
    bound: Optional[str] = None
    data: Optional[list] = None
    dest_en: Optional[str] = None
    dest_sc: Optional[str] = None
    dest_tc: Optional[str] = None
    generated_timestamp: Optional[str] = None
    orig_en: Optional[str] = None
    orig_sc: Optional[str] = None
    orig_tc: Optional[str] = None
    route: Optional[str] = None
    service_type: Optional[str] = None
    type: Optional[str] = None
    version: Optional[str] = None


@dataclass
class RouteLoadMatch:
    id: str


@dataclass
class RouteListMatch:
    bound: Optional[str] = None
    data: Optional[list] = None
    dest_en: Optional[str] = None
    dest_sc: Optional[str] = None
    dest_tc: Optional[str] = None
    generated_timestamp: Optional[str] = None
    orig_en: Optional[str] = None
    orig_sc: Optional[str] = None
    orig_tc: Optional[str] = None
    route: Optional[str] = None
    service_type: Optional[str] = None
    type: Optional[str] = None
    version: Optional[str] = None


@dataclass
class RouteStop:
    bound: Optional[str] = None
    route: Optional[str] = None
    seq: Optional[str] = None
    service_type: Optional[str] = None
    stop: Optional[str] = None


@dataclass
class RouteStopListMatch:
    direction: str
    route: str
    service_type: str


@dataclass
class Stop:
    data: Optional[dict] = None
    generated_timestamp: Optional[str] = None
    lat: Optional[str] = None
    long: Optional[str] = None
    name_en: Optional[str] = None
    name_sc: Optional[str] = None
    name_tc: Optional[str] = None
    stop: Optional[str] = None
    type: Optional[str] = None
    version: Optional[str] = None


@dataclass
class StopLoadMatch:
    id: str


@dataclass
class StopListMatch:
    data: Optional[dict] = None
    generated_timestamp: Optional[str] = None
    lat: Optional[str] = None
    long: Optional[str] = None
    name_en: Optional[str] = None
    name_sc: Optional[str] = None
    name_tc: Optional[str] = None
    stop: Optional[str] = None
    type: Optional[str] = None
    version: Optional[str] = None

