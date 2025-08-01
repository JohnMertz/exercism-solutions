package WordCount;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words {
    my ($sentence) = @_;
    my %words;
    foreach ($sentence =~ m/\b((?:\w+')?[\d\w]+)\b/g) {
        my $word = $_;
        if (defined($words{lc($word)})) {
            $words{lc($word)}++;
        } else {
            $words{lc($word)} = 1;
        }
    }
    return \%words;
}

1;
