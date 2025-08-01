package TwelveDays;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

our @days = (
    {
        "number" => "first",
        "gift" => "a Partridge in a Pear Tree"
    },{
        "number" => "second",
        "gift" => "two Turtle Doves"
    },{
        "number" => "third",
        "gift" => "three French Hens"
    },{
        "number" => "fourth",
        "gift" => "four Calling Birds"
    },{
        "number" => "fifth",
        "gift" => "five Gold Rings"
    },{
        "number" => "sixth",
        "gift" => "six Geese-a-Laying"
    },{
        "number" => "seventh",
        "gift" => "seven Swans-a-Swimming"
    },{
        "number" => "eighth",
        "gift" => "eight Maids-a-Milking"
    },{
        "number" => "ninth",
        "gift" => "nine Ladies Dancing"
    },{
        "number" => "tenth",
        "gift" => "ten Lords-a-Leaping"
    },{
        "number" => "eleventh",
        "gift" => "eleven Pipers Piping"
    },{
        "number" => "twelfth",
        "gift" => "twelve Drummers Drumming"
    }
);

sub recite {
    my $input = shift;
    my $ret;
    for (my $verse = $input->{start}; $verse <= $input->{end}; $verse++) {
        $ret .= "On the " . $days[$verse-1]{number} . " day of Christmas my true love gave to me: ";
        for (my $day = $verse; $day > 0; $day--) {
            if ($day == 1 && $verse != 1) {
                $ret .= "and ";
            }
            $ret .= $days[$day-1]{gift} . ", ";
        }
        $ret =~ s/, $/.\n/;
    }
    return $ret;
}

1;
