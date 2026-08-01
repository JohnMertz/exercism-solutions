<?php

define("PI", 3.14159);

class PizzaPi
{
    public function calculateDoughRequirement($pizzas, $people)
    {
	return $pizzas * (200 + $people * 20);
    }

    public function calculateSauceRequirement($pizzas, $per)
    {
	return ceil($pizzas / 2);
    }

    public function calculateCheeseCubeCoverage($cube_size, $thickness, $diameter)
    {
        return floor(($cube_size**3) / ($thickness * PI * $diameter));
    }

    public function calculateLeftOverSlices($pizzas, $friends)
    {
        return ($pizzas * 8) % $friends;
    }
}
