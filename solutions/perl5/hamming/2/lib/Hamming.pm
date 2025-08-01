package Hamming;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance($strand1,$strand2) {
    die "strands must be of equal length" unless (length($strand1) == length($strand2));
    my $distance = 0;
    for (my $i = 0; $i < length($strand1); $i++) {
        $distance++ unless (substr($strand1,$i,1) eq substr($strand2,$i,1));
    }
    return $distance;
}

1;
