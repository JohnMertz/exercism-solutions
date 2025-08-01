package SumOfMultiples;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<sum_of_multiples>;

sub sum_of_multiples($factors, $limit) {
    my (%multiples, $sum);
    foreach (@{$factors}) {
        next unless $_;
        for (my $i = $_; $i < $limit; $i += $_) {
            $multiples{$i} = 1 
        }
    }
    map { $sum += $_ } keys(%multiples);
    return $sum || 0;
}

1;
