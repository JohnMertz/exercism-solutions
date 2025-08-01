package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams ($subject, $candidates) {
    my @results;
    check_anagram($subject, $_) && push(@results, $_) foreach (@{$candidates});
    return \@results;
}

sub check_anagram ($subject, $candidate) {
    return 0 if (length($subject) != length($candidate));
    return 0 if (lc($subject) eq lc($candidate));
    my %subhash;
    $subhash{$_}++ for (split('', lc($subject)));
    foreach (split('', lc($candidate))) {
        return 0 unless defined($subhash{$_});
        return 0 unless $subhash{$_};
        $subhash{$_} -= 1;
    }
    return 1;
}

1;
