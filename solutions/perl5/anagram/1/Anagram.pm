package Anagram;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams
{
    my ( $subject, $candidates ) = @_;
    my @results;
    foreach (@{$candidates}) {
        push(@results, $_) if check_anagram($subject, $_);
    }
    return \@results;
}

sub check_anagram
{
    my $subject = lc(shift) || return 0; # Missing arg
    my $candidate = lc(shift) || return 0; # Missing arg
    return 0 if (length($subject) != length($candidate)); # Cannot match if of different length
    return 0 if (lc($subject) eq lc($candidate)); # Anagram's do not match themselves (case-insensitive)
    # Get a count for the number of each letter in each word.
    # TODO: This is inefficient because %subhash is calculated for earch candidate. It should be calculated in parent and passed here.
    my %subhash = count_chars($subject);
    my %canhash = count_chars($candidate);
    # Check that the count for each letter matches. That's basically the definition of an anagram.
    foreach (keys(%subhash)) {
        return 0 unless (defined($canhash{$_})); # Candidate does not have that letter
        return 0 unless ($subhash{$_} == $canhash{$_}); # Unequal count for letter
    }
    return 1;
}

sub count_chars
{
    my $word = shift || return {};
    my %letters = ();
    foreach (split('', $word)) {
        if (defined($letters{$_})) {
            $letters{$_}++;
        } else {
            $letters{$_} = 1;
        }
    }
    return %letters;
}

1;
