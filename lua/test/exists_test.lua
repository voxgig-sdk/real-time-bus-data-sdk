-- RealTimeBusData SDK exists test

local sdk = require("real-time-bus-data_sdk")

describe("RealTimeBusDataSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
