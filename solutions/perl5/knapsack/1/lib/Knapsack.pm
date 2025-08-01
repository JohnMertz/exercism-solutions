package Knapsack;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<maximum_value>;

sub maximum_value ($items, $weight, $offset=0, $best_score=0, @indexes) {

	foreach my $index ($offset..$#$items) {
                my @local_indexes = @indexes;

		next if ($items->[$index]->{'weight'} > $weight);

		push (@local_indexes, $index);

		my $score = 0;
		$score += $items->[$_]->{'value'} foreach @local_indexes;
		$best_score = $score if ($score > $best_score);

		next if $weight == $items->[$index]->{'weight'};
		next if ($index == $#$items);

		$best_score = maximum_value(
			$items,
			$weight - $items->[$index]->{'weight'},
			++$index,
			$best_score,
			@local_indexes
		);
	}
	return $best_score;
}

1;
