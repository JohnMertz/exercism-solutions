package Sieve;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

sub find_primes {
    my ($limit) = @_;
    my @ret;
    my %marked;
    for (my $i = 2; $i <= $limit; $i++) {
        next if (defined($marked{$i}));
        for (my $multiple = 2; $multiple*$i <= $limit; $multiple++) {
            $marked{$multiple*$i} = 1;
        }
    }
    for (my $i = 2; $i <= $limit; $i++) {
        push(@ret, $i) unless (defined($marked{$i}));
    }
    return \@ret;
}

1;
