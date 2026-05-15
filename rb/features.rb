# RealTimeBusData SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module RealTimeBusDataFeatures
  def self.make_feature(name)
    case name
    when "base"
      RealTimeBusDataBaseFeature.new
    when "test"
      RealTimeBusDataTestFeature.new
    else
      RealTimeBusDataBaseFeature.new
    end
  end
end
