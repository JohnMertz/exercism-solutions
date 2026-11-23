<?php

declare(strict_types=1);

class FoodChain
{
  public $chain = [
    [ "species" => "fly", "exclamation" => "I don't know why she swallowed the fly. Perhaps she'll die." ],
    [ "species" => "spider", "exclamation" => "It wriggled and jiggled and tickled inside her." ],
    [ "species" => "bird", "exclamation" => "How absurd to swallow a bird!" ],
    [ "species" => "cat", "exclamation" => "Imagine that, to swallow a cat!" ],
    [ "species" => "dog", "exclamation" => "What a hog, to swallow a dog!" ],
    [ "species" => "goat", "exclamation" => "Just opened her throat and swallowed a goat!" ],
    [ "species" => "cow", "exclamation" => "I don't know how she swallowed a cow!" ],
    [ "species" => "horse", "exclamation" => "She's dead, of course!" ]
  ];

  public function verse(int $verseNumber): array
  {
    $ret = [ "I know an old lady who swallowed a ".$this->chain[$verseNumber-1]['species'].'.' ];
    if ($verseNumber > 1) $ret[] = $this->chain[$verseNumber-1]['exclamation'];
    if ($verseNumber == 8) return $ret;
    for ($i = 0; $verseNumber-$i > 1; $i++) {
      $ret[] = "She swallowed the ".$this->chain[$verseNumber-($i+1)]['species']." to catch the ".$this->chain[$verseNumber-($i+2)]['species'].($verseNumber-$i == 3 ? " that wriggled and jiggled and tickled inside her." : ".");
    }
    return array_merge($ret, [ $this->chain[0]['exclamation'] ]);
  }

  public function verses(int $start, int $end): array
  {
    $ret = [];
    for ($i = $start; $i <= $end; $i++) {
      $ret = array_merge($ret, $this->verse($i), [ '' ]);
    }
    array_pop($ret);
    return $ret;
  }

  public function song(): array
  {
    return $this->verses(1, 8);
  }
}
