<?php

declare(strict_types=1);

class BottleSong
{
  public $numbers = [ 'No', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten' ];

  public function verse(int $number): string
  {
    return str_repeat($this->numbers[$number]." green bottle".($number == 1 ? "" : "s")." hanging on the wall,\n", 2)."And if one green bottle should accidentally fall,\nThere'll be ".strtolower($this->numbers[$number-1])." green bottle".($number-1 == 1 ? "" : "s")." hanging on the wall.";
  }

  public function verses(int $start, int $size = 1): string
  {
    for ($size; $size > 0; $size--) $song[] = $this->verse($start--);
    return join("\n\n", $song);
  }

  public function lyrics(): string
  {
    return $this->verses(10, 10);
  }
}
