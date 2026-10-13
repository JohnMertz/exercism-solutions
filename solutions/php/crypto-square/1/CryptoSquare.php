<?php

declare(strict_types=1);

function crypto_square(string $plaintext): string
{
    $normal = $rows = [];
    foreach (preg_split('/\W/',$plaintext) as $word) {
        $normal = array_merge($normal, str_split(strtolower($word)));
    }
    $factor1 = $init = 0;
    $factor2 = 1;
    while ($factor1 < $factor2) {
        $factor2 = ceil(sizeof($normal) / ++$factor1);
    }
    for ($col = 0; $col < $factor2; $col++) {
        for ($row = 0; $row < $factor1; $row++) {
            if (sizeof($normal)) {
                if ($init) $rows[$row] .= array_shift($normal);
                else $rows[$row] = array_shift($normal);
            } else {
                $rows[$row] .= ' ';
            }
        }
        $init = 1;
    }
    return join(' ', $rows);
}
