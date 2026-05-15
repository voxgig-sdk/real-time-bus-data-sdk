<?php
declare(strict_types=1);

// RealTimeBusData SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

RealTimeBusDataUtility::setRegistrar(function (RealTimeBusDataUtility $u): void {
    $u->clean = [RealTimeBusDataClean::class, 'call'];
    $u->done = [RealTimeBusDataDone::class, 'call'];
    $u->make_error = [RealTimeBusDataMakeError::class, 'call'];
    $u->feature_add = [RealTimeBusDataFeatureAdd::class, 'call'];
    $u->feature_hook = [RealTimeBusDataFeatureHook::class, 'call'];
    $u->feature_init = [RealTimeBusDataFeatureInit::class, 'call'];
    $u->fetcher = [RealTimeBusDataFetcher::class, 'call'];
    $u->make_fetch_def = [RealTimeBusDataMakeFetchDef::class, 'call'];
    $u->make_context = [RealTimeBusDataMakeContext::class, 'call'];
    $u->make_options = [RealTimeBusDataMakeOptions::class, 'call'];
    $u->make_request = [RealTimeBusDataMakeRequest::class, 'call'];
    $u->make_response = [RealTimeBusDataMakeResponse::class, 'call'];
    $u->make_result = [RealTimeBusDataMakeResult::class, 'call'];
    $u->make_point = [RealTimeBusDataMakePoint::class, 'call'];
    $u->make_spec = [RealTimeBusDataMakeSpec::class, 'call'];
    $u->make_url = [RealTimeBusDataMakeUrl::class, 'call'];
    $u->param = [RealTimeBusDataParam::class, 'call'];
    $u->prepare_auth = [RealTimeBusDataPrepareAuth::class, 'call'];
    $u->prepare_body = [RealTimeBusDataPrepareBody::class, 'call'];
    $u->prepare_headers = [RealTimeBusDataPrepareHeaders::class, 'call'];
    $u->prepare_method = [RealTimeBusDataPrepareMethod::class, 'call'];
    $u->prepare_params = [RealTimeBusDataPrepareParams::class, 'call'];
    $u->prepare_path = [RealTimeBusDataPreparePath::class, 'call'];
    $u->prepare_query = [RealTimeBusDataPrepareQuery::class, 'call'];
    $u->result_basic = [RealTimeBusDataResultBasic::class, 'call'];
    $u->result_body = [RealTimeBusDataResultBody::class, 'call'];
    $u->result_headers = [RealTimeBusDataResultHeaders::class, 'call'];
    $u->transform_request = [RealTimeBusDataTransformRequest::class, 'call'];
    $u->transform_response = [RealTimeBusDataTransformResponse::class, 'call'];
});
