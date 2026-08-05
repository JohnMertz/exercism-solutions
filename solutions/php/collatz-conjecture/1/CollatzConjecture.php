<?php

declare(strict_types=1);

function steps(int $number): int
{
    if ($number < 1) throw new InvalidArgumentException("Only positive numbers are allowed");
    $steps = [];
    while ($number > 1) {
	$steps[] = $number;
	if ($number % 2) $number = $number * 3 + 1;
	else $number /= 2;
	if (array_search($number, $steps)) throw new ErrorException("Does not get to 1");
    }
    return sizeof($steps);
}
