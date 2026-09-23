<?php

declare(strict_types=1);

function encode(string $plainMessage, int $rails): string
{
	$rows = [];
	$ascending = 0;
	$row = 0;
	foreach (str_split($plainMessage) as $i) {
		if (isset($rows[$row])) {
			array_push($rows[$row], $i);
		} else {
			$rows[$row] = [ $i ];
		}
		if ($ascending) {
		       	if ($row == 0) {
				$ascending = 0;
				$row++;
			} else {
				$row--;
			}
		} else {
		       	if ($row == $rails-1) {
				$ascending = 1;
				$row--;
			} else {
				$row++;
			}
		}
	}
	$out = [];
	foreach ($rows as $row) {
		$out = array_merge($out, $row);
	}
	return implode($out);
}

function decode(string $cipherMessage, int $rails): string
{
	$out = [];
	$rows = [];
	$pos = 0;
	for ($i = 0; $i < $rails; $i++) {
		$ascending = 0;
		$n = $i;
		while ($n < strlen($cipherMessage)) {
			$out[$n] = $cipherMessage[$pos++];
			if ($ascending || $i == $rails-1) {
				$n += 2 * ($rails-($rails-($i+1))-1);
				$ascending = 0;
			} else {
		                $n += 2 * ($rails-($i+1));
				if ($i) $ascending = 1;
			}
		}
	}
	ksort($out, SORT_NUMERIC);
	return implode($out);
}
