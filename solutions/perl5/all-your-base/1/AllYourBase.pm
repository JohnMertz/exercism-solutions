package AllYourBase;

use strict;
use warnings;
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

    # Exception: base must be greater than one
    unless ($input->{inputBase} > 1) {
        die 'input base must be >= 2';
    }
=redundant - Same result because of initial `$dec = 0` and do-while
    # Exception: empty
    unless (scalar(@{$input->{digits}})) {
        return [ 0 ];
    }
    # Exception: all zeros
    unless (grep(/[1-9A-Fa-f]/, @{$input->{digits}})) {
        return [ 0 ];
    }
# Additional unit test have the same error, otherwise they would need to be
# duplicated. eg. 0 vs. 1; inputBase && outputBase vs. just inputBase
# Others don't have unit tests but should. eg. bases larger than hex.
=cut
    # Exception: any negative digit
    if (grep(/^\-/, @{$input->{digits}})) {
        die 'all digits must satisfy 0 <= d < input base';
    }
    # Exception: digit larger than base
    foreach (@{$input->{digits}}) {
        if ($_ >= $input->{inputBase}) {
            die 'all digits must satisfy 0 <= d < input base';
        }
    }
    # Exception: bases must be >= 2
    unless ($input->{inputBase} >= 2) {
        die 'input base must be >= 2';
    }
    unless ($input->{outputBase} >= 2) {
        die 'output base must be >= 2';
    }

    # Convert any base to decimal
    my $dec = 0;
    my $pos = 1;
    while (scalar(@{$input->{digits}})) {
        $dec += (int(pop(@{$input->{digits}})) * $pos);
        $pos *= $input->{inputBase};
    }

    # Convert decimal to any base
    my @ret;
    my $string;
    given ($input->{outputBase}) {
        default {
            $pos = 1;
            do {
                unshift(@ret,($dec % $input->{outputBase}));
                $dec -= $ret[0];
                $dec /= $input->{outputBase};
            } while ($dec > 0);
            return \@ret;
        };
    }
}

1;
