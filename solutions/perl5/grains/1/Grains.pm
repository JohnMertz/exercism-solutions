package Grains;

use strict;
use warnings;
use feature qw<say>;

use bigint;

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;

sub grains_on_square {
    my $square = shift;
    my $sum = shift || 0;
    die "square must be between 1 and 64" unless (65 > $square > 0);
    return (2**($square-1+$sum))-$sum;
}

# The sum is just one less than the next square
sub total_grains {
    return grains_on_square(64,1);
}

1;
