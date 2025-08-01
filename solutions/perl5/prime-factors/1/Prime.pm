package Prime;
use strict;
use warnings;

sub factors {
    my ($num) = @_;
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

