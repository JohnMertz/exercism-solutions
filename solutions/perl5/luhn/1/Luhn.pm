package Luhn;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid {
    my @chars = split('',shift);
    my ($sum, $ints) = (0, 0);
    while (@chars) {
        my $c = pop(@chars);
        return 0 if ($c !~ m/[0-9\ ]/);
        next if ($c eq ' ');
        if ($ints % 2) {
            $c *= 2;
            $c -= 9 if ($c > 9);
        }
        $sum += $c;
        $ints++;
    }
    return 0 if ($ints < 2);
    return !($sum%10);
}

1;
