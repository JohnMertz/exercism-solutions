<?php

declare(strict_types=1);

function factors(int $number): array
{
  $out = [];
  $primes = [];
  $i = 2;
  while ($number > 1) {
    if ($number % $i == 0) {
      array_push($out, $i);
      $number /= $i;
      continue;
    }
    $prime = 0;
    if ($i == 2) $i--;
    while (!$prime) {
      $prime = 1;
      $i+=2;
      foreach ($primes as $p) {
        if ($i % $p == 0) {
          $prime = 0;
          break;
        }
        if ($i > $p << 1) break;
      }
    }
    array_push($primes, $i);
  }
  return $out;
}
