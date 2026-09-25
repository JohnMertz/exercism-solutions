<?php

declare(strict_types=1);

function isArmstrongNumber(int $number): bool
{
	$digits = str_split(strval($number));
	foreach ($digits as $d) {
		$number -= $d ** sizeof($digits);
	}
	return !$number;
}
