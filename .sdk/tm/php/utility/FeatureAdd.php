<?php
declare(strict_types=1);

// RealTimeBusData SDK utility: feature_add

class RealTimeBusDataFeatureAdd
{
    public static function call(RealTimeBusDataContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
