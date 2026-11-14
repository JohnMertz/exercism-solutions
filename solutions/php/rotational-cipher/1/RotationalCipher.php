<?php

declare(strict_types=1);

class RotationalCipher
{
  public function rotate(string $text, int $shift): string
  {
    $out = [];
    foreach (str_split($text) as $c) {
      if (64 < ord($c) && ord($c) < 90) $out[] = chr((((ord($c)-65)+$shift)%26)+65);
      elseif (96 < ord($c) && ord($c) < 123) $out[] = chr((((ord($c)-97)+$shift)%26)+97);
      else $out[] = $c;
    }
    return join('', $out);
  }
}
