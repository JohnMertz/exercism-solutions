<?php

/*
 * By adding type hints and enabling strict type checking, code can become
 * easier to read, self-documenting and reduce the number of potential bugs.
 * By default, type declarations are non-strict, which means they will attempt
 * to change the original type to match the type specified by the
 * type-declaration.
 *
 * In other words, if you pass a string to a function requiring a float,
 * it will attempt to convert the string value to a float.
 *
 * To enable strict mode, a single declare directive must be placed at the top
 * of the file.
 * This means that the strictness of typing is configured on a per-file basis.
 * This directive not only affects the type declarations of parameters, but also
 * a function's return type.
 *
 * For more info review the Concept on strict type checking in the PHP track
 * <link>.
 *
 * To disable strict typing, comment out the directive below.
 */

declare(strict_types=1);

function encode(string $text): string
{
    $count = 0;
    $out = '';
    foreach (str_split($text) as $letter) {
	if (preg_match('/\d/', $letter)) {
	    $out .= $letter;
	} else if (preg_match('/\W/', $letter)) {
	    continue;
	} else {
	    # Invert the distance from the middle of the alphabet
	    $out .= chr( 109 + (-1 * (ord(strtolower($letter)) - 110) ) );
	}
        if ($count++ == 4) {
	    $out .= ' ';
	    $count = 0;
	}
    }
    return trim($out);
}

function decode(string $text): string
{
    $out = '';
    foreach (str_split($text) as $letter) {
	if (preg_match('/\d/', $letter)) {
	    $out .= $letter;
	} else if (preg_match('/\W/', $letter)) {
	    continue;
	} else {
	    $out .= chr( 109 + (-1 * (ord(strtolower($letter)) - 110) ) );
	}
    }
    return $out;
}
