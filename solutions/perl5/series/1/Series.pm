package Series;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices {
    my ($args) = @_;
    die ("slice length cannot be zero") unless ($args->{'sliceLength'});
    die ("series cannot be empty") unless ($args->{'series'});
    die ("slice length cannot be negative") unless ($args->{'sliceLength'} > 0);
    die ("slice length cannot be greater than series length") if (length($args->{'series'}) < $args->{'sliceLength'});
    my (@working, @ret);
    my @nums = split('', $args->{'series'});
    while (scalar(@nums)) {
        push(@working, shift(@nums));
        if (scalar(@working) == $args->{'sliceLength'}) {
            push(@ret, join('', @working));
            shift(@working);
        }
    }
    return \@ret;
}

1;
