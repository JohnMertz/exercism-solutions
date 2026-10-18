<?php

declare(strict_types=1);

function maskify(string $cc): string
{
	if (strlen($cc) < 6) return $cc;
	for ($i = 0; $i < strlen($cc); $i++) {
		if ($i != 0 && $i < strlen($cc)-4 && preg_match('/\d/', substr($cc, $i, 1))) $cc[$i] = '#';
	}
	return $cc;
}
