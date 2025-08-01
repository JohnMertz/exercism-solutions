package Sieve;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

sub find_primes($limit) {
    my %marked;
    for my $n (2 .. $limit) {
        next if (defined($marked{$n}));
        for my $m (2 .. $limit/$n) {
            $marked{$m*$n} = 1;
        }
    }
    return [ map { defined($marked{$_}) ? () : $_ } ( 2 .. $limit) ];
}

1;
