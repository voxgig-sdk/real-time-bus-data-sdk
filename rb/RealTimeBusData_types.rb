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
# @!attribute [rw] co
#   @return [String, nil]
#
# @!attribute [rw] data
#   @return [Array, nil]
#
# @!attribute [rw] data_timestamp
#   @return [String, nil]
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
# @!attribute [rw] dir
#   @return [String, nil]
#
# @!attribute [rw] eta
#   @return [String, nil]
#
# @!attribute [rw] eta_seq
#   @return [Integer, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
#
# @!attribute [rw] rmk_en
#   @return [String, nil]
#
# @!attribute [rw] rmk_sc
#   @return [String, nil]
#
# @!attribute [rw] rmk_tc
#   @return [String, nil]
#
# @!attribute [rw] route
#   @return [String, nil]
#
# @!attribute [rw] seq
#   @return [Integer, nil]
#
# @!attribute [rw] service_type
#   @return [Integer, nil]
#
# @!attribute [rw] stop
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
Eta = Struct.new(
  :co,
  :data,
  :data_timestamp,
  :dest_en,
  :dest_sc,
  :dest_tc,
  :dir,
  :eta,
  :eta_seq,
  :generated_timestamp,
  :rmk_en,
  :rmk_sc,
  :rmk_tc,
  :route,
  :seq,
  :service_type,
  :stop,
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

# Request payload for Eta#list.
#
# @!attribute [rw] route
#   @return [String]
#
# @!attribute [rw] service_type
#   @return [String]
#
# @!attribute [rw] stop_id
#   @return [String]
EtaListMatch = Struct.new(
  :route,
  :service_type,
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

# Match filter for Route#list (any subset of Route fields).
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
RouteStop = Struct.new(
  :bound,
  :route,
  :seq,
  :service_type,
  :stop,
  keyword_init: true
)

# Request payload for RouteStop#list.
#
# @!attribute [rw] direction
#   @return [String]
#
# @!attribute [rw] route
#   @return [String]
#
# @!attribute [rw] service_type
#   @return [String]
RouteStopListMatch = Struct.new(
  :direction,
  :route,
  :service_type,
  keyword_init: true
)

# Stop entity data model.
#
# @!attribute [rw] data
#   @return [Hash, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
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
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
Stop = Struct.new(
  :data,
  :generated_timestamp,
  :lat,
  :long,
  :name_en,
  :name_sc,
  :name_tc,
  :stop,
  :type,
  :version,
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

# Match filter for Stop#list (any subset of Stop fields).
#
# @!attribute [rw] data
#   @return [Hash, nil]
#
# @!attribute [rw] generated_timestamp
#   @return [String, nil]
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
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
StopListMatch = Struct.new(
  :data,
  :generated_timestamp,
  :lat,
  :long,
  :name_en,
  :name_sc,
  :name_tc,
  :stop,
  :type,
  :version,
  keyword_init: true
)

