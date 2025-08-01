package TwoFer;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer {
    return "One for ".(scalar(@_) ? shift : 'you').", one for me.";
}

1;
