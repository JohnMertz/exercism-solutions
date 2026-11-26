<?php

declare(strict_types=1);

function isValid(string $number): bool
{
  $chars = str_split(strval($number));
  $ints = $sum = 0;
  while (sizeof($chars)) {
    $c = array_pop($chars);
    if ($c == ' ') continue;
    if (!is_numeric($c)) return False;
    $c = intval($c);
    if ($ints++ % 2 == 1) {
      $c *= 2;
      if ($c > 9) $c -= 9;
    }
    $sum += $c;
  }
  return $sum % 10 || $ints < 2 ? False : True;
}
