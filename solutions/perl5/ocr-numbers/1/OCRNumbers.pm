package OCRNumbers;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<convert>;

our $hash = {
    ' _ | ||_|' => '0',
    '     |  |' => 1,
    ' _  _||_ ' => 2,
    ' _  _| _|' => 3,
    '   |_|  |' => 4,
    ' _ |_  _|' => 5,
    ' _ |_ |_|' => 6,
    ' _   |  |' => 7,
    ' _ |_||_|' => 8,
    ' _ |_| _|' => 9
};

sub convert {
    my ($rows) = @_;
    my @return;
    # Process until all input is complete.
    die "Number of input lines is not a multiple of four" if (scalar(@{$rows})%4);
    die "Number of input columns is not a multiple of three" if (length($rows->[0])%3);
    # This is bad because it always assumes that the rows are in mulitples of 4
    while (scalar(@{$rows})) {
        # Pass first three lines to identifier function
        push(@return, identify_line(shift(@{$rows}), shift(@{$rows}), shift(@{$rows})));
        # Discard fourth line because it is always empty
        # This is also bad because the '?' exceptions could be a valid character where
        # the forth line is NOT empty
        shift(@{$rows});
    }
    # Join lines with ',' if necessary and return
    return join(',',@return);
}

sub identify_line {
    my ($row1, $row2, $row3) = @_;
    # Break each row of text at character boundaries (every 3rd character)
    my @line1 = $row1 =~ m/(.{3})/g;
    my @line2 = $row2 =~ m/(.{3})/g;
    my @line3 = $row3 =~ m/(.{3})/g;
    my $ret = '';
    for (my $i = 0; $i < scalar(@line1); $i++) {
        # Look for a pattern matching known characters by simply joining their lines
        # If one if found, append that character to the list
        if (defined($hash->{$line1[$i].$line2[$i].$line3[$i]})) {
            $ret .= $hash->{$line1[$i].$line2[$i].$line3[$i]};
        # If invalid, apppend "?"
        } else {
            $ret .= "?";
        }
    }
    # Join characters with no whitespace and return
    return $ret;
}

1;
