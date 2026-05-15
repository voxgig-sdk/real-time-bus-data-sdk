package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewEtaEntityFunc func(client *RealTimeBusDataSDK, entopts map[string]any) RealTimeBusDataEntity

var NewRouteEntityFunc func(client *RealTimeBusDataSDK, entopts map[string]any) RealTimeBusDataEntity

var NewRouteStopEntityFunc func(client *RealTimeBusDataSDK, entopts map[string]any) RealTimeBusDataEntity

var NewStopEntityFunc func(client *RealTimeBusDataSDK, entopts map[string]any) RealTimeBusDataEntity

