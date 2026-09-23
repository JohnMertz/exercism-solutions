<?php

declare(strict_types=1);

function getClassification(int $number): string
{
    if ($number < 1) throw new InvalidArgumentException();
    $factors = [];
    # Very slow factorization; we should ideally eliminate multiples of any number that is not a factor without needing to test them; oh well...
    for ($i = 1; $i <= $number/2; $i++) {
        if ($number % $i == 0) array_push($factors, $i);
    }
    $sum = array_sum($factors);
    if ($sum == $number) return 'perfect';
    if ($sum < $number) return 'deficient';
    return 'abundant';
}
