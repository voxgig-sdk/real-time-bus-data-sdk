// Typed models for the RealTimeBusData SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/real-time-bus-data-sdk/go/core"
)

// Eta is the typed data model for the eta entity.
type Eta struct {
	Data *[]any `json:"data,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// EtaLoadMatch is the typed request payload for Eta.LoadTyped.
type EtaLoadMatch struct {
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
	Id *string `json:"id,omitempty"`
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
	Id *string `json:"id,omitempty"`
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
	Data *[]any `json:"data,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	Route *string `json:"route,omitempty"`
	Seq *string `json:"seq,omitempty"`
	ServiceType *string `json:"service_type,omitempty"`
	Stop *string `json:"stop,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// RouteStopLoadMatch is the typed request payload for RouteStop.LoadTyped.
type RouteStopLoadMatch struct {
	Direction string `json:"direction"`
	Route string `json:"route"`
	ServiceType string `json:"service_type"`
}

// RouteStopListMatch is the typed request payload for RouteStop.ListTyped.
type RouteStopListMatch struct {
	Bound *string `json:"bound,omitempty"`
	Data *[]any `json:"data,omitempty"`
	GeneratedTimestamp *string `json:"generated_timestamp,omitempty"`
	Route *string `json:"route,omitempty"`
	Seq *string `json:"seq,omitempty"`
	ServiceType *string `json:"service_type,omitempty"`
	Stop *string `json:"stop,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *string `json:"version,omitempty"`
}

// Stop is the typed data model for the stop entity.
type Stop struct {
	Id *string `json:"id,omitempty"`
	Lat *string `json:"lat,omitempty"`
	Long *string `json:"long,omitempty"`
	NameEn *string `json:"name_en,omitempty"`
	NameSc *string `json:"name_sc,omitempty"`
	NameTc *string `json:"name_tc,omitempty"`
	Stop *string `json:"stop,omitempty"`
}

// StopLoadMatch is the typed request payload for Stop.LoadTyped.
type StopLoadMatch struct {
	Id string `json:"id"`
}

// StopListMatch is the typed request payload for Stop.ListTyped.
type StopListMatch struct {
	Id *string `json:"id,omitempty"`
	Lat *string `json:"lat,omitempty"`
	Long *string `json:"long,omitempty"`
	NameEn *string `json:"name_en,omitempty"`
	NameSc *string `json:"name_sc,omitempty"`
	NameTc *string `json:"name_tc,omitempty"`
	Stop *string `json:"stop,omitempty"`
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

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
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

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
