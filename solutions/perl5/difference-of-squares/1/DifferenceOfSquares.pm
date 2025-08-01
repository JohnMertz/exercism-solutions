package DifferenceOfSquares;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<square_of_sum sum_of_squares difference_of_squares>;

# I assume that there is a more efficient formula or library for these, but I'll just do it the slow way
# Big O of '(n)'! Oh on! :P
sub square_of_sum {
    my ($number) = @_;
    my $sum = 0;
    while ($number) {
        $sum += $number--;
    }
    return $sum**2;
}

sub sum_of_squares {
    my ($number) = @_;
    my $sum = 0;
    while ($number) {
        $sum += ($number--)**2;
    }
    return $sum;
}

sub difference_of_squares {
    my ($number) = @_;
    return (square_of_sum($number) - sum_of_squares($number));
}

1;
