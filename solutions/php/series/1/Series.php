<?php

declare(strict_types=1);

function slices(string $digits, int $series): array
{
    if ($series < 1) throw new Exception("Slice length cannot be < 1");
    if ($series > strlen($digits)) throw new Exception("Slice longer than input");
    $out = [];
    for ($i = 0; $i+$series <= strlen($digits); $i++) {
	    $out[] = substr($digits, $i, $series);
    }
    return $out;
}
