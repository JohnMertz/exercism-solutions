package Darts;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

sub score_dart ( $x, $y ) {
	# Distance from center is just pythagoras
	my $py = sqrt($x*$x + $y*$y);
	return 0 if ($py > 10);
	return 1 if ($py > 5);
	return 5 if ($py > 1);
	return 10;
}
