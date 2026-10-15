<?php

declare(strict_types=1);

class TwelveDays
{
	public $days = [
		[ "number" => "first", "gift" => "a Partridge in a Pear Tree" ],
		[ "number" => "second", "gift" => "two Turtle Doves" ],
		[ "number" => "third", "gift" => "three French Hens" ],
		[ "number" => "fourth", "gift" => "four Calling Birds" ],
		[ "number" => "fifth", "gift" => "five Gold Rings" ],
		[ "number" => "sixth", "gift" => "six Geese-a-Laying" ],
		[ "number" => "seventh", "gift" => "seven Swans-a-Swimming" ],
		[ "number" => "eighth", "gift" => "eight Maids-a-Milking" ],
		[ "number" => "ninth", "gift" => "nine Ladies Dancing" ],
		[ "number" => "tenth", "gift" => "ten Lords-a-Leaping" ],
		[ "number" => "eleventh", "gift" => "eleven Pipers Piping" ],
		[ "number" => "twelfth", "gift" => "twelve Drummers Drumming" ],
	];
	public function recite(int $start, int $end): string
	{
		$out = [];	
		for ($verse = $start-1; $verse < $end; $verse++) {
			$line = "On the ". $this->days[$verse]["number"]." day of Christmas my true love gave to me: ";
			for ($day = $verse; $day >= 0; $day--) {
				$line .= $this->days[$day]["gift"];
				if ($day == 1) {
					$line .= ", and ";
				} else if ($day == 0) {
					$line .= ".";
				} else {
					$line .= ", ";
				}
			}
			array_push($out, $line);
		}
		return join("\n", $out);
	}
}
