<?php

declare(strict_types=1);

function distance(string $strandA, string $strandB): int
{
	if (strlen($strandA) != strlen($strandB)) throw new InvalidArgumentException("strands must be of equal length");
	$distance = 0;
	for ($i = 0; $i < strlen($strandA); $i++) {
		if (substr($strandA, $i, 1) != substr($strandB, $i, 1)) $distance++;
	}
	return $distance;
}
