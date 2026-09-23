<?php

declare(strict_types=1);

function diamond(string $letter): array
{
    if ($letter == 'A') return [ 'A' ];;
    $offset = ord($letter) - 66;
    $out = [ str_repeat(' ',$offset+1).'A'.str_repeat(' ',$offset+1) ];
    for ($line = 0; $line < $offset; $line++) {
	$out[] = str_repeat(' ',$offset-$line).chr(66+$line).str_repeat(' ',$line*2+1).chr(66+$line).str_repeat(' ',$offset-$line);
    }
    for ($line = $offset; $line >= 0; $line--) {
	$out[] = str_repeat(' ',$offset-$line).chr(66+$line).str_repeat(' ',$line*2+1).chr(66+$line).str_repeat(' ',$offset-$line);
    }
    $out[] = str_repeat(' ',$offset+1).'A'.str_repeat(' ',$offset+1);
    return $out;
}
