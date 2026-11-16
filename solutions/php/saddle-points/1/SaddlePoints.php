<?php

declare(strict_types=1);

function saddlePoints(array $matrix): array
{
  $out = [];
  for ($y = 0; $y < sizeof($matrix); $y++) {
    $row = $matrix[$y];
    rsort($row);
    for ($x = 0; $x < sizeof($matrix[$y]); $x++) {
      if ($row[0] == $matrix[$y][$x]) {
        $col = [];
        foreach ($matrix as $r) $col[] = $r[$x];
        sort($col);
        if ($col[0] == $matrix[$y][$x]) $out[] = [ 'column' => $x+1, 'row' => $y+1 ];
      }
    }
  }
  return $out;
}
