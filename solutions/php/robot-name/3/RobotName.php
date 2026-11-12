<?php

declare(strict_types=1);

class Robot
{
  private static array $registry = [];
  private string $name;

  public function getName(): string {
    if (!isset($this->name)) $this->reset();
    return $this->name;
  }

  public function reset(): void {
    do {
      $this->name = '';
      for ($i = 0; $i < 5; $i++) $this->name .= ($i < 2 ? chr(65+rand(0,25)) : rand(0,9));
    } while (isset(self::$registry[$this->name]));
    self::$registry[$this->name] = 1;
  }
}
