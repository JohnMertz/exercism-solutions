# Declare package 'Bob'
package Bob;

use strict;
use warnings;
use feature qw<say>;    # Use the `say` function to output debugging info in the online editor.

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey {
    my $msg = shift || '';
    my $lower = 'a-z';
    my $upper = 'A-Z';
    my $numeric = '0-9';
    my $special = "'\%\^\*\\\@\#\$\(\)\!\.\,: ";
    return "Fine. Be that way!" if ($msg =~ m/^\s*$/);
    return "Calm down, I know what I'm doing!" if (($msg =~ m/^[$upper$numeric$special]+\?\s*$/) && ($msg =~ m/[$upper]/));
    return "Sure." if ($msg =~ m/^[$upper$lower$numeric$special]+\?\s*$/);
    return "Whoa, chill out!" if ($msg =~ m/^[$upper$numeric$special]+$/ && $msg =~ m/[$upper]/);
    return "Whatever.";
}

1;
