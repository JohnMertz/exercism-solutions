package BottleSong;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<sing>;

my %numbers = (
    0  => 'No',
    1  => 'One',
    2  => 'Two',
    3  => 'Three',
    4  => 'Four',
    5  => 'Five',
    6  => 'Six',
    7  => 'Seven',
    8  => 'Eight',
    9  => 'Nine',
    10 => 'Ten',
);

sub verse($count) {
    return 
        ($numbers{$count}." green bottle".($count == 1 ? "" : "s")." hanging on the wall,\n") x 2 .
        "And if one green bottle should accidentally fall,\n" .
        "There'll be ".lc($numbers{$count-1})." green bottle".($count-1 == 1 ? "" : "s")." hanging on the wall.";
}

sub sing($bottles, $verses) {
    return 0 if ($verses > $bottles); # Can't knock over more bottles than exist
    my @song;
    for ($verses; $verses > 0; $verses--) {
        push(@song, verse($bottles));
        $bottles--;
    }
    return join("\n\n", @song);
}

1;
