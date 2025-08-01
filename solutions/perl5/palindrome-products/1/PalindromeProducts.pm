package PalindromeProducts;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<smallest_palindrome largest_palindrome>;

# TODO: Gets VERY slow after 3 digits. Could realy use further optimizations, but I did some.

sub smallest_palindrome {
    my ( $min, $max ) = @_;
    die ("min must be <= max") if ($min > $max);
    my %ret = ( 'value' => undef, 'factors' => [] );
    for (my $i = $min; $i <= $max; $i++) {
        # Don't try duplicate pairs by starting at the current value of $i
        for (my $j = $i; $j <= $max; $j++) {
            # Skip if it is not possible to be smaller
            next if (defined($ret{'value'}) && ($i > $ret{'value'} || $j > $ret{'value'}));
            my $prod = $i * $j;
            my $reverse = '';
            $reverse .= substr($prod, -$_, 1) for 1 .. length($prod);
            # Skip if it is not a palinedrome
            next unless ($prod == $reverse);
            # Additional set of factors for the same value
            if (defined($ret{'value'}) && $prod == $ret{value}) {
                push(@{$ret{'factors'}}, [ $i, $j ]);
            # Re-initialize if smaller/lower than current
            } elsif (!defined($ret{'value'}) || $prod < $ret{'value'}) {
                %ret = (
                    'value' => $prod,
                    'factors' => [ [ $i, $j ] ],
                );
            }
            # Not possible to have a smaller value using the same $i, so move on
            last;
        }
    }
    return \%ret;
}

sub largest_palindrome {
    my ( $min, $max ) = @_;
    die ("min must be <= max") if ($min > $max);
    my %ret = ( 'value' => undef, 'factors' => [] );
    for (my $i = $max; $i >= $min; $i--) {
        # Don't try duplicate pairs by starting at the current value of $i
        for (my $j = $i; $j >= $min; $j--) {
            # Skip if it is not possible to be smaller
            next if (defined($ret{'value'}) && ($i > $ret{'value'} || $j > $ret{'value'}));
            my $prod = $i * $j;
            my $reverse = '';
            $reverse .= substr($prod, -$_, 1) for 1 .. length($prod);
            # Skip if it is not a palinedrome
            next unless ($prod == $reverse);
            # Additional set of factors for the same value
            if (defined($ret{'value'}) && $prod == $ret{value}) {
                push(@{$ret{'factors'}}, [ $i, $j ]);
            # Re-initialize if smaller/lower than current
            } elsif (!defined($ret{'value'}) || $prod > $ret{'value'}) {
                %ret = (
                    'value' => $prod,
                    'factors' => [ [ $j, $i ] ],
                );
            }
            # Not possible to have a larger value using the same $i, so move on
            last;
        }
    }
    return \%ret;
}

1;
