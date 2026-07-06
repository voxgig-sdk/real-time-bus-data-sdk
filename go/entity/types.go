// Typed models for the RealTimeBusData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Eta is the typed data model for the eta entity.
type Eta struct {
	Co *string `json:"co,omitempty"`
	Data *[]any `json:"data,omitempty"`
	DataTimestamp *string `json:"data_timestamp,omitempty"`
	DestEn *string `json:"dest_en,omitempty"`
	DestSc *string `json:"dest_sc,omitempty"`
	DestTc *string `json:"dest_tc,omitempty"`
	Dir *string `json:"dir,omitempty"`
	Eta *string `json:"eta,omitempty"`
	EtaSeq *int `json:"eta_seq,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	RmkEn *string `json:"rmk_en,omitempty"`
	RmkSc *string `json:"rmk_sc,omitempty"`
	RmkTc *string `json:"rmk_tc,omitempty"`
	Route *string `json:"route,omitempty"`
	Seq *int `json:"seq,omitempty"`
	ServiceType *int `json:"service_type,omitempty"`
	Stop *string `json:"stop,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// EtaLoadMatch is the typed request payload for Eta.LoadTyped.
type EtaLoadMatch struct {
	StopId string `json:"stop_id"`
}

// EtaListMatch is the typed request payload for Eta.ListTyped.
type EtaListMatch struct {
	Route string `json:"route"`
	ServiceType string `json:"service_type"`
	StopId string `json:"stop_id"`
}

// Route is the typed data model for the route entity.
type Route struct {
	Bound *string `json:"bound,omitempty"`
	Data *[]any `json:"data,omitempty"`
	DestEn *string `json:"dest_en,omitempty"`
	DestSc *string `json:"dest_sc,omitempty"`
	DestTc *string `json:"dest_tc,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	OrigEn *string `json:"orig_en,omitempty"`
	OrigSc *string `json:"orig_sc,omitempty"`
	OrigTc *string `json:"orig_tc,omitempty"`
	Route *string `json:"route,omitempty"`
	ServiceType *string `json:"service_type,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// RouteLoadMatch is the typed request payload for Route.LoadTyped.
type RouteLoadMatch struct {
	Id string `json:"id"`
}

// RouteListMatch is the typed request payload for Route.ListTyped.
type RouteListMatch struct {
	Bound *string `json:"bound,omitempty"`
	Data *[]any `json:"data,omitempty"`
	DestEn *string `json:"dest_en,omitempty"`
	DestSc *string `json:"dest_sc,omitempty"`
	DestTc *string `json:"dest_tc,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	OrigEn *string `json:"orig_en,omitempty"`
	OrigSc *string `json:"orig_sc,omitempty"`
	OrigTc *string `json:"orig_tc,omitempty"`
	Route *string `json:"route,omitempty"`
	ServiceType *string `json:"service_type,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// RouteStop is the typed data model for the route_stop entity.
type RouteStop struct {
	Bound *string `json:"bound,omitempty"`
	Route *string `json:"route,omitempty"`
	Seq *string `json:"seq,omitempty"`
	ServiceType *string `json:"service_type,omitempty"`
	Stop *string `json:"stop,omitempty"`
}

// RouteStopListMatch is the typed request payload for RouteStop.ListTyped.
type RouteStopListMatch struct {
	Direction string `json:"direction"`
	Route string `json:"route"`
	ServiceType string `json:"service_type"`
}

// Stop is the typed data model for the stop entity.
type Stop struct {
	Data *map[string]any `json:"data,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	Lat *string `json:"lat,omitempty"`
	Long *string `json:"long,omitempty"`
	NameEn *string `json:"name_en,omitempty"`
	NameSc *string `json:"name_sc,omitempty"`
	NameTc *string `json:"name_tc,omitempty"`
	Stop *string `json:"stop,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// StopLoadMatch is the typed request payload for Stop.LoadTyped.
type StopLoadMatch struct {
	Id string `json:"id"`
}

// StopListMatch is the typed request payload for Stop.ListTyped.
type StopListMatch struct {
	Data *map[string]any `json:"data,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	Lat *string `json:"lat,omitempty"`
	Long *string `json:"long,omitempty"`
	NameEn *string `json:"name_en,omitempty"`
	NameSc *string `json:"name_sc,omitempty"`
	NameTc *string `json:"name_tc,omitempty"`
	Stop *string `json:"stop,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
