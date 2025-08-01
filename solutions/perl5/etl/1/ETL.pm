package ETL;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform {
    my ($data) = @_;
    my %letters;
    foreach my $score (keys(%{$data})) {
        foreach (@{$data->{$score}}) {
            $letters{lc($_)} = $score;
        }
    }
    return \%letters;
}

1;
