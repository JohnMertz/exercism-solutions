package BottleSong;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<sing>;

my %numbers = (
    0  => 'no',
    1  => 'one',
    2  => 'two',
    3  => 'three',
    4  => 'four',
    5  => 'five',
    6  => 'six',
    7  => 'seven',
    8  => 'eight',
    9  => 'nine',
    10 => 'ten',
);

sub verse {
    my $count = shift;
    return 
        (uc(substr($numbers{$count},0,1)).substr($numbers{$count},1)." green bottle".($count == 1 ? "" : "s")." hanging on the wall,\n") x 2 .
        "And if one green bottle should accidentally fall,\n" .
        "There'll be ".$numbers{$count-1}." green bottle".($count-1 == 1 ? "" : "s")." hanging on the wall.";
}

sub sing {
    my ( $bottles, $verses ) = @_;
    return 0 if ($verses > $bottles); # Can't knock over more bottles than exist
    my @song;
    for ($verses; $verses > 0; $verses--) {
        push(@song, verse($bottles));
        $bottles--;
    }
    return join("\n\n", @song);
}

1;
