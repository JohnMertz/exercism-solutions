package Sieve;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

sub find_primes($limit) {
    my %marked;
    for (2 .. $limit) {
        next if (defined($marked{$_}));
        $marked{$multiple*$_} = 1 for (my $m = 2; $_*$m <= $limit; $m++);
    }
    return [ map { defined($marked{$_}) ? () : $_ } ( 2 .. $limit) ];
}

1;
