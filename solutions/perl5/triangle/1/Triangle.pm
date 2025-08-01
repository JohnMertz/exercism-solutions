package Triangle;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

sub is_equilateral {
    my ($triangle) = @_;
    return 0 unless ($triangle->[0]);
    return 1 if ($triangle->[0] == $triangle->[1] == $triangle->[2]);
}

sub is_isosceles {
    my ($triangle) = @_;
    return 1 if ( is_triangle($triangle) && (
        ($triangle->[0] == $triangle->[1]) ||
        ($triangle->[0] == $triangle->[2]) ||
        ($triangle->[1] == $triangle->[2])
    ) );
}

sub is_scalene {
    my ($triangle) = @_;
    return 1 if ( is_triangle($triangle) &&
        ($triangle->[0] != $triangle->[1] != $triangle->[2])
    );
}

sub is_triangle  {
    my ($triangle) = @_;
    return 0 unless ($triangle->[0] && $triangle->[1] && $triangle->[2]);
    return 1 if (
        ($triangle->[0] + $triangle->[1] >= + $triangle->[2]) &&
        ($triangle->[0] + $triangle->[2] >= + $triangle->[1]) &&
        ($triangle->[1] + $triangle->[2] >= + $triangle->[0])
    );
}

1;
