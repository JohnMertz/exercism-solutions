<?php

declare(strict_types=1);

function squareRoot(int $number): int
{
	for ($i = $number;;) {
		if ($i*$i == $number) return $i;
		$i = (int) (($i + $number / $i) / 2); // Simplified Newton approximation
	}
}
