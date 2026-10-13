<?php

declare(strict_types=1);

function winner(array $lines): ?string
{
    $rows = [];
    foreach ($lines as $line) $rows[]=preg_split('/ /', trim($line));
    $columns = pivot($rows);
    for ($startPosition = 0; $startPosition < sizeof($rows[0]) || $startPosition < sizeof($columns[0]); $startPosition++) {
	if (isset($rows[$startPosition][0] ) && $rows[$startPosition][0] == 'X') {
	    if (sizeof($rows) == 1) return 'black';
	    if (crawl('X', $rows, [$startPosition, 0], [ ], sizeof($rows[0]))) return 'black';
	}
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
    if (array_search($current, $history)) return False;
    $history[]=$current;
    if ($rows[$current[0]][$current[1]+1] == $match) {
	if ($current[1]+2 == $width) return True;
	if (crawl($match, $rows, [$current[0], $current[1]+1], $history, $width)) return True;
    }
    if ($current[0] && $rows[$current[0]-1][$current[1]+1] == $match) {
	if ($current[1]+2 == $width) {
	    return True;
	} else {
	    if (crawl($match, $rows, [$current[0]-1, $current[1]+1], $history, $width)) return True;
	}
    }
    if ($current[0] < sizeof($rows)-1 && $rows[$current[0]+1][$current[1]] == $match) {
	if (crawl($match, $rows, [$current[0]+1, $current[1]], $history, $width)) return True;
    }
    if ($current[0] && $rows[$current[0]-1][$current[1]] == $match) {
	if (crawl($match, $rows, [$current[0]-1, $current[1]], $history, $width)) return True;
    }
    if ($current[0] < sizeof($rows)-1 && $current[1] && $rows[$current[0]+1][$current[1]-1] == $match) {
	if (crawl($match, $rows, [$current[0]+1, $current[1]-1], $history, $width)) return True;
    }
    if ($current[1] && $rows[$current[0]][$current[1]-1] == $match) {
	if (crawl($match, $rows, [$current[0], $current[1]-1], $history, $width)) return True;
    }
    return False;
}
