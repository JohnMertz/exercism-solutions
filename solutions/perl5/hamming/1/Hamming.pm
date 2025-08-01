package Hamming;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance {
    my ( $strand1, $strand2 ) = @_;
    die "strands must be of equal length" unless (length($strand1) == length($strand2));
    my $distance = 0;
    for (my $i = 0; $i < length($strand1); $i++) {
        $distance++ unless (substr($strand1,$i,1) eq substr($strand2,$i,1));
    }
    return $distance;
}

1;
