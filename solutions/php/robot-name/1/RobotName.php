<?php

declare(strict_types=1);

$registry = [];

class Robot
{
  public $name;

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
    global $registry;
    do {
      $this->name = $this->generate();
    } while (isset($registry[$this->name]));
    $registry[$this->name] = 1;
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

