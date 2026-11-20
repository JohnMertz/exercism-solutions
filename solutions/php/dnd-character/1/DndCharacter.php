<?php

declare(strict_types=1);

class DndCharacter
{
  public $strength;
  public $dexterity;
  public $constitution;
  public $intelligence;
  public $wisdom;
  public $charisma;
  public $hitpoints;

  public function __construct() {}

  static public function generate(): self {
    $char = new self();
    $char->strength = $char->ability();
    $char->dexterity = $char->ability();
    $char->constitution = $char->ability();
    $char->intelligence = $char->ability();
    $char->wisdom = $char->ability();
    $char->charisma = $char->ability();
    $char->hitpoints = 10+$char->modifier($char->constitution);
    return $char;
  }

  static public function ability() {
    $die = [];
    for ($i = 0; $i < 4; $i++) $die[] = rand(1,6);
    sort($die);
    array_shift($die);
    return array_sum($die);
  }

  static public function modifier($value) {
    return floor(($value-10)/2);
  }

}
