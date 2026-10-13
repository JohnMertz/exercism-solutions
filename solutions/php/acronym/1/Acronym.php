<?php

declare(strict_types=1);

function acronym(string $text): string
{
    $out = '';
    foreach (preg_split('/\W/', $text) as $word) {
        $out .= mb_strtoupper(substr(trim($word), 0, 1));
    }
    return $out;
}
