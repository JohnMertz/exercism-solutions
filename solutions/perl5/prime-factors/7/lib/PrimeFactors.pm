package PrimeFactors;

use v5.38;
use Exporter qw(import);
our @EXPORT_OK = qw(factors);

sub factors($number) {
    my @factors;
    for (my $i = 2; $i <= $number; $i++) {
        unless ($number%$i) {
            push (@factors, $i);
            $number /= $i--;
        }
    }
    return \@factors;
}

1;

