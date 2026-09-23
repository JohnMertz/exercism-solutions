<?php

declare(strict_types=1);

function getAllColors(): array
{
    return [ "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" ];
}

function colorCode(string $color): int
{
    $v = 0;
    foreach (getallColors() as $i) {
        if ($i == $color) return $v;
	$v++;
    }
}
