<?php

declare(strict_types=1);

function arrayToDec(array $digits, int $base): int
{
    $position = 0;
    $out = 0;
    while (sizeof($digits)) {
        if (end($digits) < 0 || end($digits) >= $base) throw new InvalidArgumentException('all digits must satisfy 0 <= d < input base');
	$out += array_pop($digits) * ($base ** $position++);
    }
    return $out;
}

function decToArray(int $dec, int $base): array
{
    if (!$dec) return [ 0 ];
    $out = [];
    while ($dec) {
	array_unshift($out, $dec % $base);
	$dec = ($dec - ($dec % $base)) / $base;
    }
    return $out;
}

function rebase(int $fromBase, array $digits, int $toBase): array
{
    if ($fromBase < 2) throw new InvalidArgumentException('input base must be >= 2');
    if ($toBase < 2) throw new InvalidArgumentException('output base must be >= 2');
    return decToArray(arrayToDec($digits, $fromBase), $toBase);
}
