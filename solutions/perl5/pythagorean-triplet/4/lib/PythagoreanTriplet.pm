package PythagoreanTriplet;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<triplets_with_sum>;

sub triplets_with_sum ($sum) {
    my ($a, $b, @ret) = (0);
    while ($a += 1) {
        my $n = $sum * ($sum - 2 * $a);
        my $d = 2 * ($sum - $a);
        $b = int($n / $d);
        last if $b < $a;
        next if ($n % $d);
        push @ret, [$a, $b, $sum - $a - $b];
    }
    return \@ret;
}

1;
