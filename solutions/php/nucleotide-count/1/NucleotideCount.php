<?php

declare(strict_types=1);

function nucleotideCount(string $input): array
{
    $counts = [ 'a' => 0, 'c' => 0, 't' => 0, 'g' => 0 ];
    foreach (str_split($input) as $n) {
        switch ($n) {
            case 'A':
            case 'C':
            case 'G':
            case 'T':
                $counts[strtolower($n)]++;
                break;
            default:
                throw new errorException("Invalid");
        }
    }
    return $counts;
}
