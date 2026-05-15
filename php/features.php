<?php
declare(strict_types=1);

// RealTimeBusData SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class RealTimeBusDataFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new RealTimeBusDataBaseFeature();
            case "test":
                return new RealTimeBusDataTestFeature();
            default:
                return new RealTimeBusDataBaseFeature();
        }
    }
}
