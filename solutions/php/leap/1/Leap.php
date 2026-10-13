<?php

declare(strict_types=1);

function isLeap(int $year): bool
{
    if ($year%400 == 0) return True;
    if ($year%100 == 0) return False;
    if ($year%4 == 0) return True;
    return False;
}
