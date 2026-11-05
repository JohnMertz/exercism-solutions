<?php

declare(strict_types=1);

function pascalsTriangleRows(int $rowCount)
{
  $rows = [];
  for ($y = 0; $y < $rowCount; $y++) {
    for ($x = 0; $x < $y+1; $x++) {
      if (!isset($rows[$y-1]) || !isset($rows[$y])) {
        $rows[$y] = [ 1 ];
      } else {
        array_push($rows[$y], ($x ? $rows[$y-1][$x-1] : 0) + ($x < sizeof($rows[$y-1]) ? $rows[$y-1][$x] : 0));
      }
    }
  }
  return $rows;
}
