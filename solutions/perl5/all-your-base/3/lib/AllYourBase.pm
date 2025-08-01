package AllYourBase;

use strict;
use warnings;
use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

sub rebase( $input, $inputBase, $outputBase ) {

    die 'input base must be >= 2' unless ($inputBase > 1);
    die 'output base must be >= 2' unless ($outputBase > 1);
    return [ 0 ] unless (scalar(@{$input}));
    my @sorted = sort(@{$input});
    die 'all digits must satisfy 0 <= d < input base' if ($sorted[0] < 0 || $sorted[scalar(@sorted)-1] >= $inputBase);

    my $dec = 0;
    # Just join digits if already in decimal
    if ($inputBase == 10) {
        $dec = join('', @{$input});
    # Convert any other base to decimal
    } else {
        my $pos = 1;
        while (scalar(@{$input})) {
            $dec += (int(pop(@{$input})) * $pos);
            $pos *= $inputBase;
        }
    }
    # Early return if decimal is wanted
    return [ split(//, $dec) ] if ($outputBase == 10);

    my @ret;
    do {
        # Add the modulus as new most significant digit
        unshift(@ret,($dec % $outputBase));
        # Remove that value to create remainder
        $dec -= $ret[0];
        # Shift one decimal place
        $dec /= $outputBase;
    } while ($dec > 0);
    return \@ret;
}

1;
