package Raindrops;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

sub raindrop {
    my ($number) = @_;
    my $noise;
    $noise .= "Pling" unless ($number % 3);
    $noise .= "Plang" unless ($number % 5);
    $noise .= "Plong" unless ($number % 7);
    return ($noise ? $noise : $number);
}

1;
