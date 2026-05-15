<?php
declare(strict_types=1);

// RealTimeBusData SDK base feature

class RealTimeBusDataBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(RealTimeBusDataContext $ctx, array $options): void {}
    public function PostConstruct(RealTimeBusDataContext $ctx): void {}
    public function PostConstructEntity(RealTimeBusDataContext $ctx): void {}
    public function SetData(RealTimeBusDataContext $ctx): void {}
    public function GetData(RealTimeBusDataContext $ctx): void {}
    public function GetMatch(RealTimeBusDataContext $ctx): void {}
    public function SetMatch(RealTimeBusDataContext $ctx): void {}
    public function PrePoint(RealTimeBusDataContext $ctx): void {}
    public function PreSpec(RealTimeBusDataContext $ctx): void {}
    public function PreRequest(RealTimeBusDataContext $ctx): void {}
    public function PreResponse(RealTimeBusDataContext $ctx): void {}
    public function PreResult(RealTimeBusDataContext $ctx): void {}
    public function PreDone(RealTimeBusDataContext $ctx): void {}
    public function PreUnexpected(RealTimeBusDataContext $ctx): void {}
}
