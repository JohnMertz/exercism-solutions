<?php

declare(strict_types=1);

function placeQueen(int $xCoordinate, int $yCoordinate): bool
{
	if ($xCoordinate < 0 || $yCoordinate < 0 || $xCoordinate >= 8 || $yCoordinate >= 8) throw new InvalidArgumentException("Placement out of range");
	return True;
}

function canAttack(array $whiteQueen, array $blackQueen): bool
{
	if (
		placeQueen($whiteQueen[0], $whiteQueen[1]) &&
		placeQueen($blackQueen[0], $blackQueen[1]) &&
		(
			$whiteQueen[0] == $blackQueen[0] || 
			$whiteQueen[1] == $blackQueen[1] || 
			$whiteQueen[0]-$whiteQueen[1] == $blackQueen[0]-$blackQueen[1] ||
			$whiteQueen[1]-$whiteQueen[0] == $blackQueen[1]-$blackQueen[0] ||
			$whiteQueen[0]+$whiteQueen[1] == $blackQueen[0]+$blackQueen[1]
		)
	) return True;
	return False;
}
