<?php

declare(strict_types=1);

function score(float $x, float $y): int
{
	$py = sqrt($x*$x + $y*$y);
	if ($py > 10) return 0;
	if ($py > 5) return 1;
	if ($py > 1) return 5;
	return 10;
}
