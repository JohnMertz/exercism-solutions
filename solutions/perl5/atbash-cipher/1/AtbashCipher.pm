package AtbashCipher;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

# Look-up tables are not elegant, but they are fast:
our %cipher = (
    'a' => 'z',
    'A' => 'z',
    'b' => 'y',
    'B' => 'y',
    'c' => 'x',
    'C' => 'x',
    'd' => 'w',
    'D' => 'w',
    'e' => 'v',
    'E' => 'v',
    'f' => 'u',
    'F' => 'u',
    'g' => 't',
    'G' => 't',
    'h' => 's',
    'H' => 's',
    'i' => 'r',
    'I' => 'r',
    'j' => 'q',
    'J' => 'q',
    'k' => 'p',
    'K' => 'p',
    'l' => 'o',
    'L' => 'o',
    'm' => 'n',
    'M' => 'n',
    'n' => 'm',
    'N' => 'm',
    'o' => 'l',
    'O' => 'l',
    'p' => 'k',
    'P' => 'k',
    'q' => 'j',
    'Q' => 'j',
    'r' => 'i',
    'R' => 'i',
    's' => 'h',
    'S' => 'h',
    't' => 'g',
    'T' => 'g',
    'u' => 'f',
    'U' => 'f',
    'v' => 'e',
    'V' => 'e',
    'w' => 'd',
    'W' => 'd',
    'x' => 'c',
    'X' => 'c',
    'y' => 'b',
    'Y' => 'b',
    'z' => 'a',
    'Z' => 'a',
);

sub lookup 
{
    my $ret_ref = shift;
    my $letter = shift;
    # Numbers are unchanged
    if ($letter =~ m/\d/) {
        $$ret_ref .= $letter;
        return 1;
    # Translate letters
    } elsif (defined($cipher{$letter})) {
        $$ret_ref .= $cipher{$letter};
        return 1;
    }
    # Invalid charater
    return 0;
}

sub decode_atbash {
    my ($phrase) = @_;
    my $ret = "";
    my $ret_ref = \$ret;
    lookup($ret_ref, $_) foreach (split('',$phrase));
    return $ret;
}

# They are identical
sub encode_atbash {
    my ($phrase) = @_;
    my $ret = "";
    my $ret_ref = \$ret;
    my $counter = 0;
    foreach (split('',$phrase)) {
        # Add space after every 5th character
        if ($counter == 5) {
            $ret .= ' ';
            $counter = 0;
        }
        # Count only valid characters
        $counter++ if (lookup($ret_ref, $_));
    }
    # Remove trailing whitespace
    $ret =~ s/\s+$//;
    return $ret;
}

1;
