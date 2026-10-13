<?php

declare(strict_types=1);

class Clock
{
    public int $hour = 0;
    public int $minute = 0;

    public function __construct(int $hour = 0, int $minute = 0)
    {
	$this->hour = $hour;
	$this->minute = $minute;
	$this->normalize();
    }

    public function add(int $minutes = 0): string
    {
	$add = new Clock(0, $minutes);
	$this->hour += $add->hour;
	$this->minute += $add->minute;
	$this->normalize();
	return $this->__toString();
    }
    
    public function sub(int $minutes = 0): string
    {
	$sub = new Clock(0, $minutes);
	$this->hour -= $sub->hour;
	$this->minute -= $sub->minute;
	$this->normalize();
	return $this->__toString();
    }
    
    public function __toString(): string
    {
	return sprintf("%02d:%02d", $this->hour, $this->minute);
    }

    private function normalize(): void
    {
	$this->hour = ($this->hour + floor($this->minute/60)) % 24;
	$this->minute = $this->minute % 60;
	while ($this->hour < 0) $this->hour += 24;
	while ($this->minute < 0) $this->minute += 60;
    }
}
