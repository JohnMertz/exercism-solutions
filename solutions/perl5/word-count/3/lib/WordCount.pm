package WordCount;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words($sentence) {
    my $count = {};
    ++$count->{lc($_)} foreach ($sentence =~ m/\b((?:\w+')?[\d\w]+)\b/g);
    return $count;
}

1;
