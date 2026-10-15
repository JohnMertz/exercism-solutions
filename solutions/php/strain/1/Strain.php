<?php

declare(strict_types=1);

class Strain
{
	public function keep(array $list, callable $predicate): array
	{
		$kept = [];
		foreach ($list as $item) {
			if ($predicate($item)) array_push($kept, $item);
		}
		return $kept;
	}

	public function discard(array $list, callable $predicate): array
	{
		$kept = [];
		foreach ($list as $item) {
			if (!$predicate($item)) array_push($kept, $item);
		}
		return $kept;
	}
}
