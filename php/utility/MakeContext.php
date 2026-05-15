<?php
declare(strict_types=1);

// RealTimeBusData SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class RealTimeBusDataMakeContext
{
    public static function call(array $ctxmap, ?RealTimeBusDataContext $basectx): RealTimeBusDataContext
    {
        return new RealTimeBusDataContext($ctxmap, $basectx);
    }
}
