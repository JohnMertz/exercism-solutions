package FoodChain;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

our @chain = (
    {
        "species" => "fly",
        "exclamation" => "I don't know why she swallowed the fly. Perhaps she'll die.",
    },{
        "species" => "spider",
        "exclamation" => "It wriggled and jiggled and tickled inside her.",
    },{
        "species" => "bird",
        "exclamation" => "How absurd to swallow a bird!",
    },{
        "species" => "cat",
        "exclamation" => "Imagine that, to swallow a cat!",
    },{
        "species" => "dog",
        "exclamation" => "What a hog, to swallow a dog!",
    },{
        "species" => "goat",
        "exclamation" => "Just opened her throat and swallowed a goat!",
    },{
        "species" => "cow",
        "exclamation" => "I don't know how she swallowed a cow!",
    },{
        "species" => "horse",
        "exclamation" => "She's dead, of course!",
    }
);

sub recite {
    my ( $start, $end ) = @_;
    return '' unless ($start && $end);
    my $ret;
    for (my $i = $start-1; $i < $end; $i++) {
        $ret .= "I know an old lady who swallowed a ".$chain[$i]{'species'}.".\n";
        $ret .= $chain[$i]{'exclamation'}."\n";
        last if ($chain[$i]{'species'} eq 'horse');
        for (my $j = $i; $j > 0; $j--) {
            $ret .= "She swallowed the ".$chain[$j]{'species'}." to catch the ".$chain[$j-1]{'species'}.($j == 2 ? " that wriggled and jiggled and tickled inside her" : "").".\n";
        }
        $ret .= $chain[0]{'exclamation'}."\n" if ($i);
        $ret .= "\n";
    }
    return $ret;
}

1;
