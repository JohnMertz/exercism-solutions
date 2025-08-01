package LargestSeriesProduct;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

sub largest_product {
    my ( $digits, $span ) = @_;
    return 1 unless ($span);
    die "span must not be negative" if ($span < 0);
    die "span must be smaller than string length" if (length($digits) < $span);

    my ($product, $largest, @working) = (0);
    foreach (split('',$digits)) {
        die "digits input must only contain digits" unless ($_ =~ m/\d/);
        push(@working, $_);
        next if (scalar(@working) < $span);
        shift(@working) if (scalar(@working) > $span);
        my $p = 1;
        map { $p *= $_ } @working;
        if ($p > $product) {
            $largest = join('', @working);
            $product = $p;
        }
    }
    return $product;
}

1;
