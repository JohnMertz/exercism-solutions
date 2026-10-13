<?php

declare(strict_types=1);


function say(int $number): string
{
	if ($number > 999_999_999_999 || $number < 0) throw new InvalidArgumentException("Input out of range");
	if ($number == "0") return "zero";
	$thousands = [ "", " thousand", " million", " billion" ];
	$out = $blocks = [];
	preg_match_all('/([0-9]{1,3})/', strrev("$number"), $blocks);
	foreach ($blocks[0] as $b) {
		$out[] = rtrim(
			(strlen($b) > 2 && substr($b, 2, 1) != "0" ? _toText(substr($b, 2, 1))." hundred " : "") .
			(strlen($b) > 1	? _toText(substr($b, 0, 1),substr($b, 1, 1)) : _toText($b))
		);
		if (end($out) == "") {
			array_pop($out);
			array_shift($thousands);
		} else {
			$out[] = array_pop($out).array_shift($thousands);
		}
	}
	return join(' ', array_reverse($out));
}

function _toText(string $one, string $two = "0"): string
{
	$ones = [ "0" => "", "1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine" ];
	$teens = [ "0" => "", "1" => "eleven", "2" => "twelve", "3" => "thirteen", "4" => "fourteen", "5" => "fifteen", "6" => "sixteen", "7" => "seventeen", "8" => "eighteen", "9" => "nineteen" ];
	$tens = [ "0" => "", "1" => "ten", "2" => "twenty", "3" => "thirty", "4" => "forty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety" ];
	if ($one == "0") return ($two == "0" ? "" : $tens[$two]);
	return ($two == "1" ? $teens[$one] : $tens[$two].($one != "0" && $two != "0" ? "-" : "").$ones[$one]);
}
