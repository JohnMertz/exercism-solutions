package CryptoSquare;

use v5.38;
use POSIX qw<ceil>;

use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

sub cipher($text) {
    # To lowercase
    $text = lc($text);
    # Remove punctuation/spaces
    $text =~ s/[^\w]//g;
    # Store text as an array of single characters
    my @letters = split('', $text);
    # Return early if input is empty
    return "" unless(scalar(@letters));
    # Calculate grid size, rounding up
    my $c = ceil(sqrt(scalar(@letters)));
    my $r = ceil(scalar(@letters)/$c);
    # Empty spaces left over
    my $s = ($r*$c)-scalar(@letters);

    # Shift the letters in order by traversing top-to-bottom, then left-to-right
    my @rows;
    for (my $y = 0; $y < $r; $y++) {
        for (my $x = 0; $x < $c; $x++) {
            # Somewhat ugly logic to determine where whitespace goes...
            # If the remaining area to the bottom right from the working cell is <= the number of spaces needed...
            if (($r-$y)*($c-$x) <= $s && (
                # and there are an odd number of spaces left to fill,
                $s%2 == 1 ||
                # or an even number of spaces but we are able  to add the (favoured) vertical space
                ($s%2 == 0 && ($r-$y) <= ($c-$x))
            # then add a space instead of shifting a character
            )) {
                $rows[$x] .= ' ';
            # Otherwise just shift the next letter to the working cell
            } else {
                $rows[$x] .= shift(@letters);
            }
        }
    }
    return join(' ',@rows);
}

1;
