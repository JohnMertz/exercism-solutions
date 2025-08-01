package LargestSeriesProduct;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

sub largest_product($digits, $span) {
    die "span must not be negative" if ($span < 0);
    die "span must be smaller than string length" if (length($digits) < $span);
    my ($product, @working) = (0);
    foreach (split('',$digits)) {
        die "digits input must only contain digits" unless ($_ =~ m/\d/);
        push(@working, $_);
        next if (scalar(@working) < $span);
        shift(@working) if (scalar(@working) > $span);
        my $p = 1;
        map { $p *= $_ } @working;
        $product = $p if ($p > $product);
    }
    return $product;
}

1;
