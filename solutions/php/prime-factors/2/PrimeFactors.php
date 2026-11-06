<?php

declare(strict_types=1);

function factors(int $number): array
{
  $out = [];
  for ($i = 2; $i <= $number; $i++) {
    if ($number%$i == 0) {
      array_push($out, $i);
      $number /= $i--;
    }
  }
  return $out;
}
