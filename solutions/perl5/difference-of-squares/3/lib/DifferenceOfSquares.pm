package DifferenceOfSquares;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<square_of_sum sum_of_squares difference_of_squares>;

sub square_of_sum($max) {
    return ($max * ($max + 1) / 2)**2;
}

sub sum_of_squares($max) {
    return $max * ($max+1) * (2 * $max + 1) / 6;
}

sub difference_of_squares($number) {
    return (square_of_sum($number) - sum_of_squares($number));
}

1;
