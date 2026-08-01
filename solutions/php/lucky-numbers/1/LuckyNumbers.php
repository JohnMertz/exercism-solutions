<?php

class LuckyNumbers
{
    private function arrayToInt(array $digits): int
    {
	$int = 0;
	$position = 1;
	while (sizeof($digits)) {
	    $int += array_pop($digits) * $position;
	    $position *= 10;
	    #print("Currently: $int");
	}
	return $int;
    }

    public function sumUp(array $digitsOfNumber1, array $digitsOfNumber2): int
    {
	#print("Number 1: " . $this->arrayToInt($digitsOfNumber1) . ", Number 2: " . $this->arrayToInt($digitsOfNumber2));
	return $this->arrayToInt($digitsOfNumber1) + $this->arrayToInt($digitsOfNumber2);
    }

    public function isPalindrome(int $number): bool
    {
	$digits = str_split(strval($number));
	while (sizeof($digits)) {
	    $head = array_shift($digits);
	    if (!sizeof($digits)) return True;
	    $tail = array_pop($digits);
	    if ($head != $tail) return False;
	}
	return True;
    }

    public function validate(string $input): string
    {
	if ($input == '') return 'Required field';
	if (preg_match('/^[1-9]\d*$/', trim($input))) return '';
	if (preg_match('/^[1-9]\d*(\.\d+)?([eE]\d+)?$/', trim($input))) return '';
	if (preg_match('/^000\d+\-plus$/', trim($input))) return '';
	return 'Must be a whole number larger than 0';
    }
}
