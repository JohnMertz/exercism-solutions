package ETL;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform($data) {
    my %letters;
    foreach my $score (keys(%{$data})) {
        foreach (@{$data->{$score}}) {
            $letters{lc($_)} = $score;
        }
    }
    return \%letters;
}

1;
