package PigLatin;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<translate>;

sub translate {
    my ($phrase) = @_;
    my $ret = '';
    foreach (split('\s+', $phrase )) {
        $ret .= swap($_);
    }
    $ret =~ s/\b[^\w]*$//g;
    return $ret;
}

sub swap {
    my $word = shift;
    my $vowels = '[aeiou]|xr|yt';
    my $cons = '[bcdfghjklmnpqrstvwxz]';
    unless ( $word =~ m/^($vowels)/ ) {
        $word =~ s/^(${cons}?qu|y|${cons}+)(y?)(.*)/$2$3$1/;
    }
    return $word . 'ay ';
}
1;
