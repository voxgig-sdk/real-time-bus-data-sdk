// Typed models for the RealTimeBusData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Eta {
  co?: string
  data?: any[]
  data_timestamp?: string
  dest_en?: string
  dest_sc?: string
  dest_tc?: string
  dir?: string
  eta?: string
  eta_seq?: number
  generated_timestamp?: string
  rmk_en?: string
  rmk_sc?: string
  rmk_tc?: string
  route?: string
  seq?: number
  service_type?: number
  stop?: string
  type?: string
  version?: string
}

export interface EtaLoadMatch {
  stop_id: string
}

export interface EtaListMatch {
  route: string
  service_type: string
  stop_id?: string
}

export interface Route {
  bound?: string
  data?: any[]
  dest_en?: string
  dest_sc?: string
  dest_tc?: string
  generated_timestamp?: string
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
  route?: string
  seq?: string
  service_type?: string
  stop?: string
}

export interface RouteStopListMatch {
  direction?: string
  route?: string
  service_type?: string
}

export interface Stop {
  data?: Record<string, any>
  generated_timestamp?: string
  lat?: string
  long?: string
  name_en?: string
  name_sc?: string
  name_tc?: string
  stop?: string
  type?: string
  version?: string
}

export interface StopLoadMatch {
  id: string
}

export interface StopListMatch {
  data?: Record<string, any>
  generated_timestamp?: string
  lat?: string
  long?: string
  name_en?: string
  name_sc?: string
  name_tc?: string
  stop?: string
  type?: string
  version?: string
}

