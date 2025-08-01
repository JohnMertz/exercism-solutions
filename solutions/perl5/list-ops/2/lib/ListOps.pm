package ListOps;

use v5.40;

sub append ( $list1, $list2 ) {
    return [ @$list1, @$list2 ];
}

sub concat ($lists) {
    my $list1 = shift(@$lists) || return [];
    $list1 = append($list1, $_) foreach (@$lists);
    return $list1;
}

sub filter ( $func, $list ) {
    return [ grep { $func->($_) } @$list ];
}

sub length ($list) {
    return scalar(@$list);
}

sub map ( $func, $list ) {
    return [ map { $func->($_) } @$list ];
}

sub foldl ( $func, $initial, $list ) {
    $initial = $func->($initial, $_) foreach (@$list);
    return $initial;
}

sub foldr ( $func, $initial, $list ) {
    $initial = $func->($initial, pop(@$list)) || return $initial;
    $initial = $func->($initial, $_) foreach (@$list);
    return $initial;
}

sub reverse ($list) {
    return [ map { $list->[scalar(@$list)-$_] } (1..scalar(@$list)) ];
}

1;
