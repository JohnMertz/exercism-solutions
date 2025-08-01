package Sublist;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

sub compare_lists {
    my ($args) = @_;
    return "equal" if (join(',', @{$args->{listOne}}) eq join(',', @{$args->{listTwo}}));
    if (scalar(@{$args->{listOne}}) < scalar(@{$args->{listTwo}})) {
        return "sublist" if sublist(\@{$args->{listTwo}},\@{$args->{listOne}});
    } elsif (scalar(@{$args->{listOne}}) > scalar(@{$args->{listTwo}})) {
        return "superlist" if sublist(\@{$args->{listOne}},\@{$args->{listTwo}});
    }
    return "unequal";
}

sub sublist {
    my ($arr1, $arr2) = @_;
    my @working;
    while (scalar(@{$arr1})) {
        push(@working, shift(@{$arr1})) while (scalar(@working) < scalar(@{$arr2}));
        return 1 if (join(',', @working) eq join(',', @{$arr2}));
        shift(@working);
    }
}

1;
