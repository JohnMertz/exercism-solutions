package SecretHandshake;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;

sub handshake($number) {
    my @actions;
    push(@actions, 'wink') if ($number & 1);
    push(@actions, 'double blink') if ($number & 2);
    push(@actions, 'close your eyes') if ($number & 4);
    push(@actions, 'jump') if ($number & 8);
    return [ reverse(@actions) ] if ($number & 16);
    return \@actions;
}

1;
