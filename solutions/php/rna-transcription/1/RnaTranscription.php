<?php

declare(strict_types=1);

function toRna(string $dna): string
{
  $complement = [ 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' ];
  $out = [];
  foreach (str_split($dna) as $c) {
    array_push($out, $complement[$c]);
  }
  return join('', $out);
}
