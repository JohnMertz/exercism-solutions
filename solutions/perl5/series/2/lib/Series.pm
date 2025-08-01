package Series;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices($series, $length) {
    die ("slice length cannot be zero") unless ($length);
    die ("series cannot be empty") unless ($series);
    die ("slice length cannot be negative") unless ($length > 0);
    die ("slice length cannot be greater than series length") if (length($series) < $length);
    my (@working, @ret);
    my @nums = split('', $series);
    while (scalar(@nums)) {
        push(@working, shift(@nums));
        if (scalar(@working) == $length) {
            push(@ret, join('', @working));
            shift(@working);
        }
    }
    return \@ret;
}

1;
