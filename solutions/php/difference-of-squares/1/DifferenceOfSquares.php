<?php

declare(strict_types=1);

function squareOfSum(int $max): int
{
    $sum = 0;
    while ($max > 0) {
        $sum += $max--;
    }
    return $sum**2;
}

function sumOfSquares(int $max): int
{
    $sum = 0;
    while ($max > 0) {
        $sum += ($max--)**2;
    }
    return $sum;
}

function difference(int $max): int
{
    return squareOfSum($max) - sumOfSquares($max);
}
