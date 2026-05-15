# RealTimeBusData SDK utility: make_context
require_relative '../core/context'
module RealTimeBusDataUtilities
  MakeContext = ->(ctxmap, basectx) {
    RealTimeBusDataContext.new(ctxmap, basectx)
  }
end
