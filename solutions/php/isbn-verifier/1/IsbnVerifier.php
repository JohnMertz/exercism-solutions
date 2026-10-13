<?php

declare(strict_types=1);

class IsbnVerifier
{
    public function isValid(string $isbn): bool
    {
	    $chars = str_split($isbn);
	    $sum = 0;
	    for ($i = 10; $i >= 1; $i--) {
		    if (sizeof($chars) == 0) return false;
		    $char = array_shift($chars);
		    if ($char == '-') $i++;
		    else if ($char == 'X' && $i == 1) $sum += 10;
		    else if ($char == 'X') return False;
		    else if (preg_match('/[^0-9]/', $char)) return False;
		    else $sum += (int) $char * $i;
	    }
	    if (sizeof($chars)) return false;
	    return ($sum % 11 == 0 ? True : False);
    }
}
