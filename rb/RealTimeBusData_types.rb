# frozen_string_literal: true

# Typed models for the RealTimeBusData SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Eta entity data model.
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
Eta = Struct.new(
  :data,
  :generated_timestamp,
  :type,
  :version,
  keyword_init: true
)

# Request payload for Eta#load.
#
# @!attribute [rw] stop_id
#   @return [String]
EtaLoadMatch = Struct.new(
  :stop_id,
  keyword_init: true
)

# Route entity data model.
#
# @!attribute [rw] bound
#   @return [String, nil]
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] dest_en
#   @return [String, nil]
#
# @!attribute [rw] dest_sc
#   @return [String, nil]
#
# @!attribute [rw] dest_tc
#   @return [String, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] orig_en
#   @return [String, nil]
#
# @!attribute [rw] orig_sc
#   @return [String, nil]
#
# @!attribute [rw] orig_tc
#   @return [String, nil]
#
# @!attribute [rw] route
#   @return [String, nil]
#
# @!attribute [rw] service_type
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
Route = Struct.new(
  :bound,
  :data,
  :dest_en,
  :dest_sc,
  :dest_tc,
  :generated_timestamp,
  :orig_en,
  :orig_sc,
  :orig_tc,
  :route,
  :service_type,
  :type,
  :version,
  keyword_init: true
)

# Request payload for Route#load.
#
# @!attribute [rw] id
#   @return [String]
RouteLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Route#list.
#
# @!attribute [rw] bound
#   @return [String, nil]
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] dest_en
#   @return [String, nil]
#
# @!attribute [rw] dest_sc
#   @return [String, nil]
#
# @!attribute [rw] dest_tc
#   @return [String, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] orig_en
#   @return [String, nil]
#
# @!attribute [rw] orig_sc
#   @return [String, nil]
#
# @!attribute [rw] orig_tc
#   @return [String, nil]
#
# @!attribute [rw] route
#   @return [String, nil]
#
# @!attribute [rw] service_type
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
RouteListMatch = Struct.new(
  :bound,
  :data,
  :dest_en,
  :dest_sc,
  :dest_tc,
  :generated_timestamp,
  :orig_en,
  :orig_sc,
  :orig_tc,
  :route,
  :service_type,
  :type,
  :version,
  keyword_init: true
)

# RouteStop entity data model.
#
# @!attribute [rw] bound
#   @return [String, nil]
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] route
#   @return [String, nil]
#
# @!attribute [rw] seq
#   @return [String, nil]
#
# @!attribute [rw] service_type
#   @return [String, nil]
#
# @!attribute [rw] stop
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
RouteStop = Struct.new(
  :bound,
  :data,
  :generated_timestamp,
  :route,
  :seq,
  :service_type,
  :stop,
  :type,
  :version,
  keyword_init: true
)

# Request payload for RouteStop#load.
#
# @!attribute [rw] direction
#   @return [String]
#
# @!attribute [rw] route
#   @return [String]
#
# @!attribute [rw] service_type
#   @return [String]
RouteStopLoadMatch = Struct.new(
  :direction,
  :route,
  :service_type,
  keyword_init: true
)

# Request payload for RouteStop#list.
#
# @!attribute [rw] bound
#   @return [String, nil]
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] route
#   @return [String, nil]
#
# @!attribute [rw] seq
#   @return [String, nil]
#
# @!attribute [rw] service_type
#   @return [String, nil]
#
# @!attribute [rw] stop
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
RouteStopListMatch = Struct.new(
  :bound,
  :data,
  :generated_timestamp,
  :route,
  :seq,
  :service_type,
  :stop,
  :type,
  :version,
  keyword_init: true
)

# Stop entity data model.
#
# @!attribute [rw] lat
#   @return [String, nil]
#
# @!attribute [rw] long
#   @return [String, nil]
#
# @!attribute [rw] name_en
#   @return [String, nil]
#
# @!attribute [rw] name_sc
#   @return [String, nil]
#
# @!attribute [rw] name_tc
#   @return [String, nil]
#
# @!attribute [rw] stop
#   @return [String, nil]
Stop = Struct.new(
  :lat,
  :long,
  :name_en,
  :name_sc,
  :name_tc,
  :stop,
  keyword_init: true
)

# Request payload for Stop#load.
#
# @!attribute [rw] id
#   @return [String]
StopLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Stop#list.
#
# @!attribute [rw] lat
#   @return [String, nil]
#
# @!attribute [rw] long
#   @return [String, nil]
#
# @!attribute [rw] name_en
#   @return [String, nil]
#
# @!attribute [rw] name_sc
#   @return [String, nil]
#
# @!attribute [rw] name_tc
#   @return [String, nil]
#
# @!attribute [rw] stop
#   @return [String, nil]
StopListMatch = Struct.new(
  :lat,
  :long,
  :name_en,
  :name_sc,
  :name_tc,
  :stop,
  keyword_init: true
)

