package PigLatin;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<translate>;

sub translate($phrase) {
    my @ret;
    push(@ret,swap($_)) foreach (split('\s+', $phrase ));
    return join(' ', @ret);
}

sub swap($word) {
    $word =~ s/^([bcdfghjklmnpqrstvwxz]?qu|y|[bcdfghjklmnpqrstvwxz]+)(y?)(.*)/$2$3$1/ unless ( $word =~ m/^([aeiou]|xr|yt)/ );
    return $word.'ay';
}
1;
