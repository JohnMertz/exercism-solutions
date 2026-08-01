<?php

class HighSchoolSweetheart
{
    public function firstLetter(string $name): string
    {
        return substr(trim($name), 0, 1);
    }

    public function initial(string $name): string
    {
	return mb_strtoupper($this->firstLetter($name)) . ".";
    }

    public function initials(string $name): string
    {
	$names = preg_split('/\s+/', $name);
	return $this->initial($names[0]) . ' ' . $this->initial($names[1]);
    }

    public function pair(string $sweetheart_a, string $sweetheart_b): string
    {
	return "     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " . $this->initials($sweetheart_a) . "  +  " . $this->initials($sweetheart_b) . "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *";
    }
}
