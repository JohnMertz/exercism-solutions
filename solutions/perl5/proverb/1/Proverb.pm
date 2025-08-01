package Proverb;

use strict;
use warnings;

sub proverb {
    my ( $items, $qualifier ) = @_;
    my $ret;
    for (my $i = 1; $i < scalar(@{$items}); $i++) {
        $ret .= "For want of a $items->[$i-1] the $items->[$i] was lost.\n";
    }
    return $ret . "And all for the want of a" . 
        ($qualifier ? " $qualifier" : '') . " $items->[0].";
}

1;
