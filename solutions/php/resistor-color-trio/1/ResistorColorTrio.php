<?php

declare(strict_types=1);

class ResistorColorTrio
{
  public $colors = [ "black" => 0, "brown" => 1, "red" => 2, "orange" => 3, "yellow" => 4, "green" => 5, "blue" => 6, "violet" => 7, "grey" => 8, "white" => 9 ];
  public $scale =  [ "", "kilo", "mega", "giga" ];

  public function label(array $bands): string
  {
    $number = 0;
    for ($b = 0; $b < 3; $b++) {
      if ($b < 2) $number = $number * 10 + $this->colors[$bands[$b]];
      else $number *= 10**$this->colors[$bands[$b]];
    }
    preg_match("/^([1-9]*)(|0|00)(000)?(000)?(000)?$/", strval($number), $matches);
    return $matches[1].$matches[2]." ".$this->scale[sizeof($matches)-3]."ohms";
  }
}
