package Grains;

use v5.38;
use bigint;

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;

sub grains_on_square($square,$sum=0) {
    die "square must be between 1 and 64" unless (65 > $square-$sum > 0);
    return (2**($square-1+$sum))-$sum;
}

sub total_grains {
    return grains_on_square(64,1);
}

1;
