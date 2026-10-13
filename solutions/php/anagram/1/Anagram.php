<?php

declare(strict_types=1);

function anagram(array $letters, string $test): bool
{
    $test_letters = str_split($test);
    if (sizeof($letters) != sizeof($test_letters)) return False;
    foreach ($letters as $letter) {
        $misses = [];
	while ($l = array_shift($test_letters)) {
	    if (strtolower($letter) == strtolower($l)) {
		$test_letters = [ ...$test_letters, ...$misses ];
		break;
	    }
	    $misses[] = $l;
	    if (!sizeof($test_letters)) return False;
	}
    }
    return True;
}

function detectAnagrams(string $word, array $anagrams): array
{
    $matches = [];
    foreach ($anagrams as $test) {
	if (strtolower($word) == strtolower($test)) continue;
	if (anagram(str_split($word), $test)) $matches[] = $test;
    }
    return $matches;
}
