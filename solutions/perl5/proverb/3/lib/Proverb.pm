package Proverb;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<proverb>;

# Alternative implementation done by shifting words out of the array.
sub proverb($items, $qualifier=0) {
    return '' unless (scalar(@{$items}));
    my ($first, $last, $current, $ret) = shift(@{$items});
    $current = $first;
    while (scalar(@{$items})) {
        $last = $current;
        $current = shift(@{$items});
        $ret .= "For want of a $last the $current was lost.\n";
    }
    return (defined($ret) ? $ret : '') . "And all for the want of a" . 
        ($qualifier ? " $qualifier" : '') . " $first.";
}

1;
