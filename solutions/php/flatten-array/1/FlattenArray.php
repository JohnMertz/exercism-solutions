<?php

declare(strict_types=1);

function flatten(array $input): array
{
	$out = [];
	foreach ($input as $element) {
		if (gettype($element) == "NULL") continue;
		if (gettype($element) == "array") $out = array_merge($out, flatten($element));
		else $out[] = $element;
	}
	return $out;
}
