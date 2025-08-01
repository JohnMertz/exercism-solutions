package Scrabble;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

our %scores = (
    '[AEIOULNRST]' => 1,
    '[DG]' => 2,
    '[BCMP]' => 3,
    '[FHVWY]' => 4,
    '[K]' => 5,
    '[JX]' => 8,
    '[QZ]' => 10
);

sub scrabble_score($word) {
    my $score = 0;
    foreach my $letter (split('', $word)) {
        foreach my $regex (keys(%scores)) {
            if ($letter =~ m/$regex/i) {
                $score += $scores{$regex};
                last;
            }
        }
    }
    return $score;
}

1;
