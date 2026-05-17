package voxgigrealtimebusdatasdk

import (
	"github.com/voxgig-sdk/real-time-bus-data-sdk/go/core"
	"github.com/voxgig-sdk/real-time-bus-data-sdk/go/entity"
	"github.com/voxgig-sdk/real-time-bus-data-sdk/go/feature"
	_ "github.com/voxgig-sdk/real-time-bus-data-sdk/go/utility"
)

// Type aliases preserve external API.
type RealTimeBusDataSDK = core.RealTimeBusDataSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type RealTimeBusDataEntity = core.RealTimeBusDataEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type RealTimeBusDataError = core.RealTimeBusDataError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewEtaEntityFunc = func(client *core.RealTimeBusDataSDK, entopts map[string]any) core.RealTimeBusDataEntity {
		return entity.NewEtaEntity(client, entopts)
	}
	core.NewRouteEntityFunc = func(client *core.RealTimeBusDataSDK, entopts map[string]any) core.RealTimeBusDataEntity {
		return entity.NewRouteEntity(client, entopts)
	}
	core.NewRouteStopEntityFunc = func(client *core.RealTimeBusDataSDK, entopts map[string]any) core.RealTimeBusDataEntity {
		return entity.NewRouteStopEntity(client, entopts)
	}
	core.NewStopEntityFunc = func(client *core.RealTimeBusDataSDK, entopts map[string]any) core.RealTimeBusDataEntity {
		return entity.NewStopEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewRealTimeBusDataSDK = core.NewRealTimeBusDataSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
