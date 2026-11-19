<?php

declare(strict_types=1);

class GameOfLife
{
  public $new = [];

  public function __construct(public array $matrix) {}

  public function tick(): void
  {
    for ($y = 0; $y < sizeof($this->matrix); $y++) {
      for ($x = 0; $x < sizeof($this->matrix[$y]); $x++) {
        $neighbors = 0;
        if ($y > 0) {
          $neighbors += ($x > 0 ? $this->matrix[$y-1][$x-1] : 0);
          $neighbors += $this->matrix[$y-1][$x];
          $neighbors += ($x < sizeof($this->matrix[$y])-1 ? $this->matrix[$y-1][$x+1] : 0);
        }
        $neighbors += ($x > 0 ? $this->matrix[$y][$x-1] : 0);
        $neighbors += ($x < sizeof($this->matrix[$y])-1 ? $this->matrix[$y][$x+1] : 0);
        if ($y < sizeof($this->matrix)-1) {
          $neighbors += ($x > 0 ? $this->matrix[$y+1][$x-1] : 0);
          $neighbors += $this->matrix[$y+1][$x];
          $neighbors += ($x < sizeof($this->matrix[$y])-1 ? $this->matrix[$y+1][$x+1] : 0);
        }
        if ($this->matrix[$y][$x] == 1) $this->new[$y][$x] = ($neighbors < 2 || $neighbors > 3 ? 0 : 1);
        else $this->new[$y][$x] = ($neighbors == 3 ? 1 : 0);
      }
    }
    $this->matrix = $this->new;
  }
}
