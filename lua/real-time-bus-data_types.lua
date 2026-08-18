-- Typed models for the RealTimeBusData SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Eta
---@field data? table
---@field generated_timestamp? string
---@field type? string
---@field version? string

---@class EtaLoadMatch
---@field stop_id string

---@class Route
---@field bound? string
---@field data? table
---@field dest_en? string
---@field dest_sc? string
---@field dest_tc? string
---@field generated_timestamp? string
---@field orig_en? string
---@field orig_sc? string
---@field orig_tc? string
---@field route? string
---@field service_type? string
---@field type? string
---@field version? string

---@class RouteLoadMatch
---@field id string

---@class RouteListMatch
---@field bound? string
---@field data? table
---@field dest_en? string
---@field dest_sc? string
---@field dest_tc? string
---@field generated_timestamp? string
---@field orig_en? string
---@field orig_sc? string
---@field orig_tc? string
---@field route? string
---@field service_type? string
---@field type? string
---@field version? string

---@class RouteStop
---@field bound? string
---@field data? table
---@field generated_timestamp? string
---@field route? string
---@field seq? string
---@field service_type? string
---@field stop? string
---@field type? string
---@field version? string

---@class RouteStopLoadMatch
---@field direction string
---@field route string
---@field service_type string

---@class RouteStopListMatch
---@field bound? string
---@field data? table
---@field generated_timestamp? string
---@field route? string
---@field seq? string
---@field service_type? string
---@field stop? string
---@field type? string
---@field version? string

---@class Stop
---@field lat? string
---@field long? string
---@field name_en? string
---@field name_sc? string
---@field name_tc? string
---@field stop? string

---@class StopLoadMatch
---@field id string

---@class StopListMatch
---@field lat? string
---@field long? string
---@field name_en? string
---@field name_sc? string
---@field name_tc? string
---@field stop? string

local M = {}

return M
