<?php

declare(strict_types=1);

class SpaceAge
{
	
    public $age = 0;

    public function __construct(int $seconds)
    {
	$this->age = $seconds;
    }

    private function __seconds_to_years(float $ratio)
    {
	return $this->age/($ratio*31557600);
    }

    public function earth(): float
    {
	return $this->__seconds_to_years(1.0);
    }

    public function mercury(): float
    {
	return $this->__seconds_to_years(0.2408467);
    }

    public function venus(): float
    {
	return $this->__seconds_to_years(0.61519726);
    }

    public function mars(): float
    {
	return $this->__seconds_to_years(1.8808158);
    }

    public function jupiter(): float
    {
	return $this->__seconds_to_years(11.862615);
    }

    public function saturn(): float
    {
	return $this->__seconds_to_years(29.447498);
    }

    public function uranus(): float
    {
	return $this->__seconds_to_years(84.016846);
    }

    public function neptune(): float
    {
	return $this->__seconds_to_years(164.79132);
    }
}
