package Sublist;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

sub compare_lists($list1, $list2) {
    return "equal" if (join(',', @{$list1}) eq join(',', @{$list2}));
    if (scalar(@{$list1}) < scalar(@{$list2})) {
        return "sublist" if sublist($list2,$list1);
    } elsif (scalar(@{$list1}) > scalar(@{$list2})) {
        return "superlist" if sublist($list1,$list2);
    }
    return "unequal";
}

sub sublist($arr1, $arr2) {
    my @working;
    while (scalar(@{$arr1})) {
        push(@working, shift(@{$arr1})) while (scalar(@working) < scalar(@{$arr2}));
        return 1 if (join(',', @working) eq join(',', @{$arr2}));
        shift(@working);
    }
}

1;
