// Typed models for the RealTimeBusData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Eta {
  data?: any[]
  generated_timestamp?: string
  type?: string
  version?: string
}

export interface EtaLoadMatch {
  stop_id: string
}

export interface Route {
  bound?: string
  data?: any[]
  dest_en?: string
  dest_sc?: string
  dest_tc?: string
  generated_timestamp?: string
  id?: string
  orig_en?: string
  orig_sc?: string
  orig_tc?: string
  route?: string
  service_type?: string
  type?: string
  version?: string
}

export interface RouteLoadMatch {
  id: string
}

export interface RouteListMatch {
  bound?: string
  data?: any[]
  dest_en?: string
  dest_sc?: string
  dest_tc?: string
  generated_timestamp?: string
  id?: string
  orig_en?: string
  orig_sc?: string
  orig_tc?: string
  route?: string
  service_type?: string
  type?: string
  version?: string
}

export interface RouteStop {
  bound?: string
  data?: any[]
  generated_timestamp?: string
  route?: string
  seq?: string
  service_type?: string
  stop?: string
  type?: string
  version?: string
}

export interface RouteStopLoadMatch {
  direction: string
  route: string
  service_type: string
}

export interface RouteStopListMatch {
  bound?: string
  data?: any[]
  generated_timestamp?: string
  route?: string
  seq?: string
  service_type?: string
  stop?: string
  type?: string
  version?: string
}

export interface Stop {
  id?: string
  lat?: string
  long?: string
  name_en?: string
  name_sc?: string
  name_tc?: string
  stop?: string
}

export interface StopLoadMatch {
  id: string
}

export interface StopListMatch {
  id?: string
  lat?: string
  long?: string
  name_en?: string
  name_sc?: string
  name_tc?: string
  stop?: string
}

