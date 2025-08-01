package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

sub is_pangram ($text) {
    my %letters = map { chr($_) => 1 } (65..90);
    foreach (split(//, $text)) {
        delete $letters{uc($_)} if defined($letters{uc($_)});
    }
    return ! scalar(keys(%letters));
}

1;
