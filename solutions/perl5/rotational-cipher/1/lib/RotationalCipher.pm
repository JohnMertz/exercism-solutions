package RotationalCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<caesar_cipher>;

sub caesar_cipher ( $text, $shift_key ) {
    return join('', map 
        {
            if (64 < ord($_) < 91) {
                chr(
                    ord($_)+$shift_key > 90
                    ? ((ord($_)+$shift_key)%91)+65
                    : ord($_)+$shift_key
                );
            } elsif (96 < ord($_) < 123) {
                chr(
                    ord($_)+$shift_key > 122
                    ? ((ord($_)+$shift_key)%123)+97
                    : ord($_)+$shift_key
                );
            } else {
                $_;
            }
        } split(//, $text)
    );
}

1;
