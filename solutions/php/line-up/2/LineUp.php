<?php

declare(strict_types=1);

function format(string $name, int $number): string
{
	$out = "$name, you are the $number";
	if ($number % 10 == 1 && $number % 100 != 11) $out .= "st";
	else if ($number % 10 == 2 && $number % 100 != 12) $out .= "nd";
	else if ($number % 10 == 3 && $number % 100 != 13) $out .= "rd";
	else $out .= "th";
	return $out . " customer we serve today. Thank you!";
}
