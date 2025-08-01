package TwoFer;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer($name=undef) {
    return "One for ".(defined($name) ? $name : 'you').", one for me.";
}

1;
