<?php
declare(strict_types=1);

// RealTimeBusData SDK utility: result_headers

class RealTimeBusDataResultHeaders
{
    public static function call(RealTimeBusDataContext $ctx): ?RealTimeBusDataResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
