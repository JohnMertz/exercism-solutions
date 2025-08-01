# This is basically the same exercise as food-chain :/
package House;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

our @list = (
    {
        "noun" => "house that Jack built.",
    },{
        "noun" => "malt",
        "verb" => "lay in",
    },{
        "noun" => "rat",
        "verb" => "ate",
    },{
        "noun" => "cat",
        "verb" => "killed",
    },{
        "noun" => "dog",
        "verb" => "worried",
    },{
        "noun" => "cow with the crumpled horn",
        "verb" => "tossed",
    },{
        "noun" => "maiden all forlorn",
        "verb" => "milked",
    },{
        "noun" => "man all tattered and torn",
        "verb" => "kissed",
    },{
        "noun" => "priest all shaven and shorn",
        "verb" => "married",
    },{
        "noun" => "rooster that crowed in the morn",
        "verb" => "woke",
    },{
        "noun" => "farmer sowing his corn",
        "verb" => "kept",
    },{
        "noun" => "horse and the hound and the horn",
        "verb" => "belonged to",
    }
);
        
sub recite($start, $end) {
    my $ret;
    for (my $i = $start-1; $i < $end; $i++) {
        $ret .= ($i >= $start ? "\n" : "")."This is the ".$list[$i]{'noun'};
        for (my $j = $i; $j > 0; $j--) {
            $ret .= " that ".$list[$j]{'verb'}." the ".$list[$j-1]{'noun'};
        }
    }
    return $ret;
}

1;
