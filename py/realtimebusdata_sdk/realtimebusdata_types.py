# Typed models for the RealTimeBusData SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Eta(TypedDict, total=False):
    co: str
    data: list
    data_timestamp: str
    dest_en: str
    dest_sc: str
    dest_tc: str
    dir: str
    eta: str
    eta_seq: int
    generated_timestamp: str
    rmk_en: str
    rmk_sc: str
    rmk_tc: str
    route: str
    seq: int
    service_type: int
    stop: str
    type: str
    version: str


class EtaLoadMatch(TypedDict):
    stop_id: str


class EtaListMatchRequired(TypedDict):
    route: str
    service_type: str


class EtaListMatch(EtaListMatchRequired, total=False):
    stop_id: str


class Route(TypedDict, total=False):
    bound: str
    data: list
    dest_en: str
    dest_sc: str
    dest_tc: str
    generated_timestamp: str
    orig_en: str
    orig_sc: str
    orig_tc: str
    route: str
    service_type: str
    type: str
    version: str


class RouteLoadMatch(TypedDict):
    id: str


class RouteListMatch(TypedDict, total=False):
    bound: str
    data: list
    dest_en: str
    dest_sc: str
    dest_tc: str
    generated_timestamp: str
    orig_en: str
    orig_sc: str
    orig_tc: str
    route: str
    service_type: str
    type: str
    version: str


class RouteStop(TypedDict, total=False):
    bound: str
    route: str
    seq: str
    service_type: str
    stop: str


class RouteStopListMatch(TypedDict, total=False):
    direction: str
    route: str
    service_type: str


class Stop(TypedDict, total=False):
    lat: str
    long: str
    name_en: str
    name_sc: str
    name_tc: str
    stop: str


class StopLoadMatch(TypedDict):
    id: str


class StopListMatch(TypedDict, total=False):
    lat: str
    long: str
    name_en: str
    name_sc: str
    name_tc: str
    stop: str
