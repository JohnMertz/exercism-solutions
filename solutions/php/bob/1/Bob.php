<?php

declare(strict_types=1);

class Bob
{
  public function respondTo(string $str): string
  {
    $special = "'\%\^\*\\\@\#\$\(\)\!\.\,: ";
    if (preg_match('/^[A-Z0-9'.$special.']+\?\s*$/m', $str) && preg_match('/[A-Z]/', $str)) return "Calm down, I know what I'm doing!" ;
    if (preg_match('/^[A-Z0-9'.$special.']+\?\s*$/mi', $str)) return "Sure.";
    if (preg_match('/^[A-Z0-9'.$special.'\?]+$/m', $str) && preg_match('/[A-Z]/', $str))  return "Whoa, chill out!";
    if (preg_match('/^\s*$/m', $str)) return "Fine. Be that way!";
    return "Whatever.";
  }
}
