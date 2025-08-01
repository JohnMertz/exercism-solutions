package SumOfMultiples;

use strict;
use warnings;
use feature qw<say>;
use List::Util qw<sum>;

use Exporter qw<import>;
our @EXPORT_OK = qw<sum_of_multiples>;

sub sum_of_multiples {
    my ($input) = @_;
    my %multiples;
    foreach (@{$input->{'factors'}}) {
        next unless $_;
        for (my $i = $_ ; $i < $input->{'limit'}; $i += $_) {
            $multiples{$i} = 1 
        }
    }
    return sum(keys(%multiples)) || 0;
}

1;
