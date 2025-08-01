package SaddlePoints;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<saddle_points>;

sub saddle_points($matrix) {
    my @ret;
    for (my $y = 0; $y < scalar(@{$matrix}); $y++) {
        for (my $x = 0; $x < scalar(@{$matrix->[$y]}); $x++) {
	    push(@ret, { 'column' => $x+1, 'row' => $y+1 }) if (
		$matrix->[$y]->[$x] == highest(@{$matrix->[$y]}) &&
		$matrix->[$y]->[$x] == lowest(map { $_->[$x] } @{$matrix})
	    );
	}
    }
    return \@ret;
}

sub lowest(@list) {
    return (sort { $a<=>$b } @list)[0];
}

sub highest(@list) {
    return (sort { $b<=>$a } @list)[0];
}

1;
