package Gigasecond;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;
use Time::Piece;

sub add_gigasecond($time) {
    return ( Time::Piece->strptime( $time, '%Y-%m-%dT%T') + 10**9 )->datetime();
}

1;
