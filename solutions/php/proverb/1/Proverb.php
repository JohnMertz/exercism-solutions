<?php

declare(strict_types=1);

class Proverb
{

	public function recite(array $pieces = [])
	{
		$out = [];
                foreach ($pieces as $next) {
			if (isset($current)) $out[] = "For want of a $current the $next was lost.";
			$current = $next;
		}
		if (sizeof($pieces) > 0) $out[] = "And all for the want of a $pieces[0].";
		return $out;
	}
}
