package Raindrops;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

sub raindrop($number) {
    my $noise;
    $noise .= "Pling" unless ($number % 3);
    $noise .= "Plang" unless ($number % 5);
    $noise .= "Plong" unless ($number % 7);
    return ($noise ? $noise : $number);
}

1;
