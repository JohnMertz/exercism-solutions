<?php

declare(strict_types=1);

function wordCount(string $words): array
{
	preg_match_all("/\b((?:\w+')?[\d\w]+)\b/i", $words, $matches);
	$out = [];
	foreach ($matches[1] as $m) {
		if (isset($out[strtolower($m)])) $out[strtolower($m)] += 1;
	        else $out[strtolower($m)] = 1;
	}
	return $out;
}
