<?php

declare(strict_types=1);

function sumOfMultiples(int $number, array $multiples): int
{
	$out = [];
	foreach ($multiples as $i) {
	        if ($i < 1) continue;
		for ($x = $i; $x < $number; $x += $i) $out[$x] = 1;
	}
	return array_sum(array_keys($out));
}
