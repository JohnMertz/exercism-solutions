package Sublist;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

sub compare_lists($list1, $list2) {
    sublist($list2,$list1) && return "sublist" if $#$list1 < $#$list2;
    sublist($list1,$list2) && return "superlist" if $#$list1 > $#$list2;
    return "equal" if (join(',', @{$list1}) eq join(',', @{$list2}));
    return "unequal";
}

sub sublist($arr1, $arr2) {
    return join(',', @{$arr1}) =~ m/@{[join(',', @{$arr2})]}/;
}

1;
