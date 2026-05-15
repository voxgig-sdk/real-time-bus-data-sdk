# RealTimeBusData SDK utility: feature_add
module RealTimeBusDataUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
