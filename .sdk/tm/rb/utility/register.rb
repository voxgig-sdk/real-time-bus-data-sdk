# RealTimeBusData SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

RealTimeBusDataUtility.registrar = ->(u) {
  u.clean = RealTimeBusDataUtilities::Clean
  u.done = RealTimeBusDataUtilities::Done
  u.make_error = RealTimeBusDataUtilities::MakeError
  u.feature_add = RealTimeBusDataUtilities::FeatureAdd
  u.feature_hook = RealTimeBusDataUtilities::FeatureHook
  u.feature_init = RealTimeBusDataUtilities::FeatureInit
  u.fetcher = RealTimeBusDataUtilities::Fetcher
  u.make_fetch_def = RealTimeBusDataUtilities::MakeFetchDef
  u.make_context = RealTimeBusDataUtilities::MakeContext
  u.make_options = RealTimeBusDataUtilities::MakeOptions
  u.make_request = RealTimeBusDataUtilities::MakeRequest
  u.make_response = RealTimeBusDataUtilities::MakeResponse
  u.make_result = RealTimeBusDataUtilities::MakeResult
  u.make_point = RealTimeBusDataUtilities::MakePoint
  u.make_spec = RealTimeBusDataUtilities::MakeSpec
  u.make_url = RealTimeBusDataUtilities::MakeUrl
  u.param = RealTimeBusDataUtilities::Param
  u.prepare_auth = RealTimeBusDataUtilities::PrepareAuth
  u.prepare_body = RealTimeBusDataUtilities::PrepareBody
  u.prepare_headers = RealTimeBusDataUtilities::PrepareHeaders
  u.prepare_method = RealTimeBusDataUtilities::PrepareMethod
  u.prepare_params = RealTimeBusDataUtilities::PrepareParams
  u.prepare_path = RealTimeBusDataUtilities::PreparePath
  u.prepare_query = RealTimeBusDataUtilities::PrepareQuery
  u.result_basic = RealTimeBusDataUtilities::ResultBasic
  u.result_body = RealTimeBusDataUtilities::ResultBody
  u.result_headers = RealTimeBusDataUtilities::ResultHeaders
  u.transform_request = RealTimeBusDataUtilities::TransformRequest
  u.transform_response = RealTimeBusDataUtilities::TransformResponse
}
