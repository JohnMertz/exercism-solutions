package AllYourBase;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

sub rebase( $input, $inputBase, $outputBase ) {
    die 'input base must be >= 2' unless ($inputBase > 1);
    die 'output base must be >= 2' unless ($outputBase > 1);
    return [ 0 ] unless (scalar(@{$input}));
    my ($dec, $pos, @sorted, @ret) = ( 0, 1, sort(@{$input}) );
    die 'all digits must satisfy 0 <= d < input base' if ($sorted[0] < 0 || $sorted[-1] >= $inputBase);

    while (scalar(@{$input})) {
        $dec += (int(pop(@{$input})) * $pos);
        $pos *= $inputBase;
    }

    do {
        unshift(@ret,($dec % $outputBase));
        $dec -= $ret[0];
        $dec /= $outputBase;
    } while ($dec > 0);

    return \@ret;
}

1;
