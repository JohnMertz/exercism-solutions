package Proverb;

use strict;
use warnings;

# Alternative implementation done by shifting words out of the array.
sub proverb {
    my ( $items, $qualifier ) = @_;
    my ($first, $last, $current, $ret) = shift(@{$items});
    $current = $first;
    while (scalar(@{$items})) {
        $last = $current;
        $current = shift(@{$items});
        $ret .= "For want of a $last the $current was lost.\n";
    }
    return $ret . "And all for the want of a" . 
        ($qualifier ? " $qualifier" : '') . " $first.";
}

1;
