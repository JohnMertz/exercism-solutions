package Prime;
use v5.38;

sub factors($number) {
    my @factors;
    for (my $i = 2; $i <= $number; $i++) {
        unless ($number%$i) {
            push (@factors, $i);
            $number /= $i;
            $i--;
        }
    }
    return \@factors;
}

1;

