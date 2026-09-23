<?php

declare(strict_types=1);

class PhoneNumber
{
    public $number = '';

    function __construct($number) {
        $out = '';
        if (preg_match('/[a-z]/i', $number)) throw new InvalidArgumentException("letters not permitted");
        if (preg_match('/[@:!]/', $number)) throw new InvalidArgumentException("punctuations not permitted");
        foreach (str_split($number) as $i) {
            if (preg_match('/[0-9]/', $i)) $out .= $i;
        }
        if (strlen($out) < 10) throw new InvalidArgumentException("Too short");
        if (strlen($out) > 11) throw new InvalidArgumentException("Too long");
        if (strlen($out) == 11) {
            if ($out[0] != '1') throw new InvalidArgumentException("11 digits must start with 1");
            $this->number = substr($out, -10);
        } else {
            $this->number = $out;
        }
        if ($this->number[0] == '0') throw new InvalidArgumentException("area code cannot start with zero");
        if ($this->number[0] == '1') throw new InvalidArgumentException("area code cannot start with one");
        if ($this->number[3] == '0') throw new InvalidArgumentException("exchange code cannot start with zero");
        if ($this->number[3] == '1') throw new InvalidArgumentException("exchange code cannot start with one");
    }

    public function number(): string
    {
        return $this->number;
    }
}
