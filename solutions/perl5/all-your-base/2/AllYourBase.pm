package AllYourBase;

use strict;
use warnings;
use v5.26.0;
use feature "switch";
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase {
    my ($input) = @_;

    die $errors[0] unless ($input->{inputBase} > 1);
    die $errors[1] unless ($input->{outputBase} > 1);
    return [ 0 ] unless (scalar(@{$input->{digits}})); # No input should return 0 for some reason
    my @sorted = sort(@{$input->{digits}});
    die $errors[2] if ($sorted[0] < 0); # lowest digit < 0
    die $errors[2] if ($sorted[scalar(@sorted)-1] >= $input->{inputBase}); # highest digit to large for inputBase

    my $dec = 0;
    # Just join digits if already in decimal
    if ($input->{'inputBase'} == 10) {
        $dec = join('', @{$input->{digits}});
    # Convert any other base to decimal
    } else {
        my $pos = 1;
        while (scalar(@{$input->{digits}})) {
            $dec += (int(pop(@{$input->{digits}})) * $pos);
            $pos *= $input->{inputBase};
        }
    }
    # Early return if decimal is wanted
    return [ split(//, $dec) ] if ($input->{outputBase} == 10);

    my @ret;
    do {
        # Add the modulus as new most significant digit
        unshift(@ret,($dec % $input->{outputBase}));
        # Remove that value to create remainder
        $dec -= $ret[0];
        # Shift one decimal place
        $dec /= $input->{outputBase};
    } while ($dec > 0);
    return \@ret;
}

1;
