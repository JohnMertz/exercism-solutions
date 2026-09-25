<?php

declare(strict_types=1);

class Triangle
{

    public $a = 0;
    public $b = 0;
    public $c = 0;

    public function __construct(int $a, int $b, int $c)
    {
	    $this->a = $a;
	    $this->b = $b;
	    $this->c = $c;
    }

    public function isEquilateral(): bool
    {
	    return $this->__validTriangle() && $this->a == $this->b && $this->b == $this->c;
    }

    public function isIsosceles(): bool
    {
	    return $this->__validTriangle() && (
		    $this->a == $this->b ||
		    $this->a == $this->c ||
		    $this->b == $this->c
	    );
    }

    public function isScalene(): bool
    {
	    return $this->__validTriangle &&
		    $this->a != $this->b &&
		    $this->a != $this-c &&
		    $this->b != $this->c;
    }

    private function __validTriangle(): bool
    {
	    return $this->a != 0 && $this->b != 0 && $this->c != 0 &&
		    $this->a && $this->b && $this->c &&
		    $this->a + $this->b >= $this->c &&
		    $this->a + $this->c >= $this->b &&
		    $this->b + $this->c >= $this->a;
    }

}
