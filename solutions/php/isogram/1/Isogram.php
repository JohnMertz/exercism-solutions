<?php

declare(strict_types=1);

function isIsogram(string $word): bool
{
  $chars = [];
  foreach (str_split($word) as $c) {
    if (preg_match('/[a-z]/i', $c) && isset($chars[strtolower($c)])) return False;
    $chars[strtolower($c)] = 1;
  }
  return True;
}
