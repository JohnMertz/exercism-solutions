<?php

declare(strict_types=1);

function winner(array $lines): ?string
{
    $rows = [];

    # Read rows into 2d array
    foreach ($lines as $line) $rows[]=preg_split('/ /', trim($line));

    # Turn 2d array counter-clockwise so that we can solve Os accross also
    $columns = pivot($rows);

    # Loop through the first element of each row to start left-to-right search for Xs
    for ($startPosition = 0; $startPosition < sizeof($rows[0]) || $startPosition < sizeof($columns[0]); $startPosition++) {
	# If our match character is found, begin search
	if (isset($rows[$startPosition][0] ) && $rows[$startPosition][0] == 'X') {
	    # If board is only 1 column wide, we win
	    if (sizeof($rows) == 1) return 'black';
	    # Otherwise start from the current position and crawl adjacent positions
	    if (crawl('X', $rows, [$startPosition, 0], [ ], sizeof($rows[0]))) return 'black';
	}
        # Repeat left-to-right search for 0s on pivoted 2d array
	if (isset($columns[$startPosition][0]) && $columns[$startPosition][0] == 'O') {
	    if (sizeof($columns) == 1) return 'white';
	    if (crawl('O', $columns, [$startPosition, 0], [ ], sizeof($columns[0]))) return 'white';
	}
    }

    return null;
}

function pivot(array $rows): array
{
    $out = [];
    for ($row = 0; $row < sizeof($rows); $row++) {
	for ($col = 0; $col < count($rows[$row]); $col++) {
            $out[$col][] = $rows[$row][$col];
        }
    }
    return $out;
}

function crawl(string $match, array $rows, array $current, array $history, int $width): bool
{
    # Bail if we've already checked this position
    if (array_search($current, $history)) return False;
    $history[]=$current;
    # Check forward progress first.
    # Next position, same row:
    if ($rows[$current[0]][$current[1]+1] == $match) {
	# Reached the right edge
	if ($current[1]+2 == $width) {
	    return True;
	# Continue crawling
	} else {
	    if (crawl($match, $rows, [$current[0], $current[1]+1], $history, $width)) return True;
	}
    }
    # Check above-right (must not be first row)
    if ($current[0] && $rows[$current[0]-1][$current[1]+1] == $match) {
	# Reached the right edge
	if ($current[1]+2 == $width) {
	    return True;
	# Continue crawling
	} else {
	    if (crawl($match, $rows, [$current[0]-1, $current[1]+1], $history, $width)) return True;
	}
    }
    # Check below-right (must not be last row, cannot be last column, otherwise we would have won already)
    if ($current[0] < sizeof($rows)-1 && $rows[$current[0]+1][$current[1]] == $match) {
	if (crawl($match, $rows, [$current[0]+1, $current[1]], $history, $width)) return True;
    }
    # Check above-left (must not be first row)
    if ($current[0] && $rows[$current[0]-1][$current[1]] == $match) {
	if (crawl($match, $rows, [$current[0]-1, $current[1]], $history, $width)) return True;
    }
    # Check below-left (must not be last row, or first column)
    if ($current[0] < sizeof($rows)-1 && $current[1] && $rows[$current[0]+1][$current[1]-1] == $match) {
	if (crawl($match, $rows, [$current[0]+1, $current[1]-1], $history, $width)) return True;
    }
    # Previous position, same row:
    if ($current[1] && $rows[$current[0]][$current[1]-1] == $match) {
	if (crawl($match, $rows, [$current[0], $current[1]-1], $history, $width)) return True;
    }
    return False;
}
