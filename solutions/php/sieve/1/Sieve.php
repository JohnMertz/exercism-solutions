<?php

declare(strict_types=1);

function sieve(int $number): array
{
	$marked = [];
	for ($i = 2; $i <= $number; $i++) {
		if (array_key_exists($i, $marked)) continue;
		for ($m = 2; $m <= $number/$i; $m++) {
			$marked[$m*$i] = 1;
		}
	}
	$out = [];
	for ($i = 2; $i <= $number; $i++) {
		if (!array_key_exists($i, $marked)) $out[] = $i;
	}
	return $out;
}
