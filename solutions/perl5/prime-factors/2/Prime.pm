package Prime;
use v5.38;

sub factors($num) {
    my (@factors);
    for (my $i = 2; $i <= $num; $i++) {
        if ($i == $num) {
            push (@factors, $i);
            last;
        }
        if (!($num%$i)) {
            push (@factors, $i);
            $num /= $i;
            $i--;
        }
    }
    return \@factors;
}

1;

