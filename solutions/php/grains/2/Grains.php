<?php

declare(strict_types=1);

function square(int $number, int $sum = 0): string
{
  if ($number < 1) throw new InvalidArgumentException("$number must be greater than 0");
  if ($number > 64) throw new InvalidArgumentException("$number must be less than 64");
  $bits = [ 1 ];
  if ($sum) $number++;
  for ($i = 0; $i < $number-1; $i++) {
    $size = sizeof($bits);
    $carry = 0;
    for ($j = 0; $j < $size; $j++) {
      $bits[$j] *= 2;
      if ($carry > 0) $bits[$j] += $carry;
      if ($bits[$j] >= 10) {
        $carry = 1;
        $bits[$j] = $bits[$j]%10;
      } else {
        $carry = 0;
      }
    }
    if ($carry > 0) $bits[] = $carry;
  }
  if ($sum) {
    $bit = 0;
    while (true) {
      if ($bits[$bit] > 0) {
        $bits[0]--;
        break;
      }
      $bits[$bit] = 9;
      $bit++;
    }
  }
  return join('', array_reverse($bits));
}

function total(): string
{
  return square(64, 1);
}
