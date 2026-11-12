<?php

declare(strict_types=1);

class Robot
{
  private static array $registry = [];
  private string $name;

  public function __construct()
  {
    $this->reset();
  }

  public function getName(): string
  {
    return $this->name;
  }

  public function reset(): void
  {
    do {
      $this->name = $this->generate();
    } while (isset(self::$registry[$this->name]));
    self::$registry[$this->name] = 1;
  }

  private function generate(): string
  {
    $out = [];
    for ($i = 0; $i < 5; $i++) {
      if ($i < 2) array_push($out, chr(65+rand(0,25)));
      else array_push($out, rand(0,9));
    }
    return join('', $out);
  }
}
