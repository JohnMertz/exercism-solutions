<?php

declare(strict_types=1);

class HighScores
{
	public $scores = [];
	public $sorted = [];

	public function __construct(array $scores) {
		$this->sorted = $this->scores = $scores;
		rsort($this->sorted);
	}

	public function __get(string $name): mixed {
		if ($name == 'latest') return end($this->scores);
		if ($name == 'personalBest') return $this->sorted[0];
		if ($name == 'personalTopThree') return array_slice($this->sorted, 0, 3);
	}
}
