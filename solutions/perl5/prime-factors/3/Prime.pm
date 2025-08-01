package Prime;
use v5.38;

sub factors($numbers) {
    my (@factors);
    for (my $i = 2; $i <= $numbers; $i++) {
        if ($i == $numbers) {
            push (@factors, $i);
            last;
        }
        if (!($numbers%$i)) {
            push (@factors, $i);
            $numbers /= $i;
            $i--;
        }
    }
    return \@factors;
}

1;

