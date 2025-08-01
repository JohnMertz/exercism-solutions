package Minesweeper;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

sub annotate {
    my ($minefield) = @_;
    return [] unless scalar(@$minefield); # no rows
    return $minefield unless grep { /\*/ } @$minefield; # no mines in any rows (or nothing at all)
    return $minefield unless grep { /\s/ } @$minefield; # only mines in all rows
    my @tmp;
    for (my $y = -2; $y < scalar(@$minefield); $y++) {
        # Initialize row with spaces until original board height is met
        @{$tmp[$y+2]} = (' ') x length($minefield->[$y+2]) unless ($y >= scalar(@$minefield)-2);
        # Don't start checking mines until third row
        next if ($y < 0);
        # Load input row into array
        my @c = split('',$minefield->[$y]);
        # Check for mines at each position and write to surrounding spaces (where they exist) two rows above
        for (my $x = 0; $x < length($minefield->[$y]); $x++) {
            if ($c[$x] eq '*') {
                $tmp[$y][$x] = '*';
                # Above
                increment(\$tmp[$y-1][$x]) if ($y > 0);
                # Above Right
                increment(\$tmp[$y-1][$x+1]) if ($y > 0 && $x+1 < scalar(@{$tmp[$y]}));
                # Right
                increment(\$tmp[$y][$x+1]) if ($x+1 < scalar(@{$tmp[$y]}));
                # Below Right
                increment(\$tmp[$y+1][$x+1]) if ($y+1 < scalar(@$minefield) && $x+1 < scalar(@{$tmp[$y]}));
                # Below
                increment(\$tmp[$y+1][$x]) if ($y+1 < scalar(@$minefield));
                # Below Left
                increment(\$tmp[$y+1][$x-1]) if ($y+1 < scalar(@$minefield) && $x > 0);
                # Left
                increment(\$tmp[$y][$x-1]) if ($x > 0);
                # Above Left
                increment(\$tmp[$y-1][$x-1]) if ($y > 0 && $x > 0);
            }
        }

    }
    # Join 2-D array of independent values to 1-D array of strings, return
    return [map { join('', @{$_}) } @tmp];
}

sub increment {
    my $ref = shift;
    # Skip if a mine already exists
    return if ($$ref eq '*');
    # Start counter if empty
    if ($$ref eq ' ') {
        $$ref = 1
    # Increment counter if started
    } else {
        $$ref++;
    }
}

1;
