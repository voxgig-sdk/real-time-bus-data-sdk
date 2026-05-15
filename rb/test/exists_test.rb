# RealTimeBusData SDK exists test

require "minitest/autorun"
require_relative "../RealTimeBusData_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = RealTimeBusDataSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
