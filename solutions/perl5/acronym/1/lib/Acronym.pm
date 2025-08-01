package Acronym;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
    return uc( join( '', $phrase =~ m/\b(?:_)?(\w)(?:[\w'])*\b/g) );
}

1;
