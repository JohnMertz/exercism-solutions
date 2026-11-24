<?php

declare(strict_types=1);

function square(int $number): string
{
  if ($number < 1) throw new InvalidArgumentException("$number must be greater than 0");
  if ($number > 64) throw new InvalidArgumentException("$number must be less than 64");
  return strval(gmp_pow(2,$number-1));
}

function total(): string
{
  return strval(gmp_sub(gmp_pow(2,64),1));
}
