<?php

declare(strict_types=1);

class Sublist
{
	public function compare(array $listOne, array $listTwo): string
	{
		if (sizeof($listOne) < sizeof($listTwo) && $this->_sublist($listTwo, $listOne)) return "SUBLIST";
		if (sizeof($listOne) > sizeof($listTwo) && $this->_sublist($listOne, $listTwo)) return "SUPERLIST";
		if (join(',', $listOne) == join(',', $listTwo)) return "EQUAL";
		return "UNEQUAL";
	}

	private function _sublist(array $listOne, array $listTwo): bool
	{
		if (preg_match("/".join(",", $listTwo)."/", join(",", $listOne))) return True;
		return False;	
	}
}
