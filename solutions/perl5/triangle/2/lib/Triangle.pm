package Triangle;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

sub is_equilateral($triangle) {
    return 1 if ($triangle->[0] && $triangle->[0] == $triangle->[1] == $triangle->[2]);
}

sub is_isosceles($triangle) {
    return 1 if ( is_triangle($triangle) && (
        ($triangle->[0] == $triangle->[1]) ||
        ($triangle->[0] == $triangle->[2]) ||
        ($triangle->[1] == $triangle->[2])
    ) );
}

sub is_scalene($triangle) {
    return 1 if ( is_triangle($triangle) &&
        ($triangle->[0] != $triangle->[1] != $triangle->[2] != $triangle->[0])
    );
}

sub is_triangle($triangle) {
    return 1 if (
	$triangle->[0] &&
	$triangle->[1] &&
	$triangle->[2] &&
        ($triangle->[0] + $triangle->[1] >= + $triangle->[2]) &&
        ($triangle->[0] + $triangle->[2] >= + $triangle->[1]) &&
        ($triangle->[1] + $triangle->[2] >= + $triangle->[0])
    );
}

1;
