# RealTimeBusData SDK feature factory

from realtimebusdata_sdk.feature.base_feature import RealTimeBusDataBaseFeature
from realtimebusdata_sdk.feature.test_feature import RealTimeBusDataTestFeature


def _make_feature(name):
    features = {
        "base": lambda: RealTimeBusDataBaseFeature(),
        "test": lambda: RealTimeBusDataTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
