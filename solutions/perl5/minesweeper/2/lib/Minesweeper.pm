package Minesweeper;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

sub annotate($minefield) {
    return $minefield unless ($minefield =~ m/\*/); # no mines in any rows (or nothing at all)
    return $minefield unless ($minefield =~ m/ /); # only mines in all rows
    my $rows = [ map [ split(//, $_) ], split(/\n/, $minefield) ];
    return '' unless (scalar(@{$rows})); # no rows
    return '' unless (length($rows->[0])); # no columns
    for (my $y = 0; $y < scalar(@{$rows}); $y++) {
	for (my $x = 0; $x < scalar(@{$rows->[$y]}); $x++) {
            next if ($rows->[$y]->[$x] eq '*');
            # Above Left
            increment(\$rows->[$y]->[$x]) if ($y > 0 && $x > 0 && $rows->[$y-1]->[$x-1] eq '*');
            # Above
            increment(\$rows->[$y]->[$x]) if ($y > 0 && $rows->[$y-1]->[$x] eq '*');
            # Above Right
            increment(\$rows->[$y]->[$x]) if ($y > 0 && $x+1 < scalar(@{$rows->[$y]}) && $rows->[$y-1]->[$x+1] eq '*');
            # Left
            increment(\$rows->[$y]->[$x]) if ($x > 0 && $rows->[$y]->[$x-1] eq '*');
            # Right
            increment(\$rows->[$y]->[$x]) if ($x+1 < scalar(@{$rows->[$y]}) && $rows->[$y]->[$x+1] eq '*');
            # Below Left
            increment(\$rows->[$y]->[$x]) if ($y+1 < scalar(@{$rows}) && $x > 0 && $rows->[$y+1]->[$x-1] eq '*');
            # Below
            increment(\$rows->[$y]->[$x]) if ($y+1 < scalar(@{$rows}) && $rows->[$y+1]->[$x] eq '*');
            # Below Right
            increment(\$rows->[$y]->[$x]) if ($y+1 < scalar(@{$rows}) && $x+1 < scalar(@{$rows->[$y]}) && $rows->[$y+1]->[$x+1] eq '*');
        }
    }
    return join("\n", map { join("", @{$_}) } @{$rows});
}

sub increment($ref) {
    if ($$ref eq ' ') {
        $$ref = 1
    } else {
        $$ref++;
    }
}

1;
