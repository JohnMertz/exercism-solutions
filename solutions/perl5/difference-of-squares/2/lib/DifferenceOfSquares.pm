package DifferenceOfSquares;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<square_of_sum sum_of_squares difference_of_squares>;

sub square_of_sum($number) {
    my $sum = 0;
    while ($number) {
        $sum += $number--;
    }
    return $sum**2;
}

sub sum_of_squares($number) {
    my $sum = 0;
    while ($number) {
        $sum += ($number--)**2;
    }
    return $sum;
}

sub difference_of_squares($number) {
    return (square_of_sum($number) - sum_of_squares($number));
}

1;
