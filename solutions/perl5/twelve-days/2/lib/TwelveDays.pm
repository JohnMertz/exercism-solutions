package TwelveDays;

use v5.38;
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

sub recite($start, $end) {
    my @ret;
    for (my $verse = $start; $verse <= $end; $verse++) {
	my $line = "On the " . $days[$verse-1]{number} . " day of Christmas my true love gave to me: ";
        for (my $day = $verse-1; $day >= 0; $day--) {
            $line .= $days[$day]{gift};
            if ($day == 1) {
		$line .= ", and ";
	    } elsif ($day) {
                $line .= ", ";
	    } else {
		$line .= ".";
	    }
        }
	push(@ret, $line);
    }
    return join("\n",@ret);
}

1;
