<?php

declare(strict_types=1);

function transform(array $input): array
{
    $out = [];
    foreach ($input as $point => $letters) {
	foreach ($letters as $l) {
	    $out[strtolower($l)] = $point;
	}
    }
    return $out;
}
