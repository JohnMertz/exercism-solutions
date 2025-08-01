package BinarySearch;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ($array, $value) {
    die "value not in array" unless (scalar(@{$array}));
    die "value not in array" if (scalar(@{$array}) == 1 && $array->[0] != $value);
    my $mid = int(scalar(@{$array})/2) || 0;
    return $mid if ($value == $array->[$mid]);
    return binary_search( [@{$array}[0..$mid-1]], $value ) if ($value < $array->[$mid]);
    return $mid+binary_search( [$array->@[$mid..scalar(@{$array})-1]], $value );
}

1;
