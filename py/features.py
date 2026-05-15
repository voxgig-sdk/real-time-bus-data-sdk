# RealTimeBusData SDK feature factory

from feature.base_feature import RealTimeBusDataBaseFeature
from feature.test_feature import RealTimeBusDataTestFeature


def _make_feature(name):
    features = {
        "base": lambda: RealTimeBusDataBaseFeature(),
        "test": lambda: RealTimeBusDataTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
