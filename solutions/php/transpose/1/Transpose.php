<?php

declare(strict_types=1);

function transpose(array $input): array
{
	$out = [ "" ];
	$outrows = 0;
	$outcols = sizeof($input);
	foreach ($input as $row) {
		if (strlen($row) > $outrows) $outrows = strlen($row);
	}
	for ($y = 0; $y < $outcols; $y++) {
		for ($x = 0; $x < $outrows; $x++) {
			if (isset($input[$y]) && $x <= strlen($input[$y])-1) {
				$out[$x] .= substr($input[$y], $x, 1);
			} else {
				$out[$x] .= ' ';
			}
		}
	}
	$width = 0;
	for ($i = sizeof($out)-1; $i > 0; $i--) {
		$out[$i] = rtrim($out[$i]);
		while (strlen($out[$i]) < $width)$out[$i] .= ' ';
		if (strlen($out[$i]) > $width) $width = strlen($out[$i]);
	}
	return $out;
}
