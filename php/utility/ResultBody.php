<?php
declare(strict_types=1);

// RealTimeBusData SDK utility: result_body

class RealTimeBusDataResultBody
{
    public static function call(RealTimeBusDataContext $ctx): ?RealTimeBusDataResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
