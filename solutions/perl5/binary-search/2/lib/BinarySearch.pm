package BinarySearch;

use strict;
use warnings;
use feature qw<say>;
use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search {
    my ( $array, $value ) = @_;
    # Empty array
    die "value not in array" unless (scalar(@{$array}));
    # Not found as last element
    die "value not in array" if (scalar(@{$array}) == 1 && $array->[0] != $value);
    # Calculate midpoint
    my $mid = sprintf("%d", scalar(@{$array})/2) || 0;
    # On match, return index
    if ($value == $array->[$mid]) {
        return $mid;
    # If value is lower, recurse with first half.
    } elsif ($value < $array->[$mid]) {
        my @sub_array = @{$array}[0..$mid-1]; 
        # Returned index will be from the same 0 as this iteration
        return binary_search( \@sub_array, $value );
    # If value is higher, recurse with second half.
    } else {
        my @sub_array = $array->@[$mid..scalar(@{$array})-1];
        # Returned index will be offset by current $mid
        return $mid+binary_search( \@sub_array, $value );
    }
}

1;
