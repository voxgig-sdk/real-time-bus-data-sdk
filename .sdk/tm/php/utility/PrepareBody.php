<?php
declare(strict_types=1);

// RealTimeBusData SDK utility: prepare_body

class RealTimeBusDataPrepareBody
{
    public static function call(RealTimeBusDataContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
