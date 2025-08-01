package WordCount;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words($sentence) {
    my %words;
    foreach ($sentence =~ m/\b((?:\w+')?[\d\w]+)\b/g) {
        if (defined($words{lc($_)})) {
            $words{lc($_)}++;
        } else {
            $words{lc($_)} = 1;
        }
    }
    return \%words;
}

1;
