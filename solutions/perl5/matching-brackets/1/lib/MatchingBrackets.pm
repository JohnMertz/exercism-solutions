package MatchingBrackets;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<has_matching_brackets>;

sub has_matching_brackets ($text) {
    # Remove all matched pairs
    while ($text =~ m/[\[\]{}()]/) {
        my $new = $text =~ s/\([^\(\){}\[\]]*\)//r;
        $new =~ s/\[[^\(\){}\[\]]*\]//;
        $new =~ s/\{[^\(\){}\[\]]*\}//;
        $text ne $new ? $text = $new : last;
    }
    # If any of these symbols still exist, they must be unmatched.
    return $text =~ m/[\[\]{}()]/ ? 0 : 1;
}

1;
