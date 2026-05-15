# ProjectName SDK exists test

import pytest
from realtimebusdata_sdk import RealTimeBusDataSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = RealTimeBusDataSDK.test(None, None)
        assert testsdk is not None
