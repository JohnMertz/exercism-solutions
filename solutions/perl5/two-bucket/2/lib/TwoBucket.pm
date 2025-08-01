package TwoBucket;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<measure>;

sub measure ( $bucket_1, $bucket_2, $goal, $start_bucket ) {
    my ($steps, @buckets, %seen) = (1, 0, 0);
    ($bucket_1, $bucket_2) = ($bucket_2, $bucket_1) unless ($start_bucket eq 'one');
    while (1) {
        if ($buckets[0] == 0) {
            $buckets[0] = $bucket_1;
        } elsif ($bucket_2 == $goal) {
            $buckets[1] = $bucket_2;
        } elsif ($buckets[1] == $bucket_2) {
            $buckets[1] = 0;
        } else {
            if ($buckets[0] + $buckets[1] <= $bucket_2) {
                @buckets = (0, $buckets[0]+$buckets[1]);
            } else {
                @buckets = ($buckets[0]-($bucket_2-$buckets[1]), $bucket_2);
            }
        }

        die "impossible" if (defined( $seen{$buckets[0]}{$buckets[1]} ));
        $seen{$buckets[0]}{$buckets[1]} = 1;

        return { goalBucket => $start_bucket, moves => $steps, otherBucket => $buckets[1] } if ($buckets[0] == $goal);
        return { goalBucket => ($start_bucket eq 'one' ? 'two' : 'one'), moves => $steps, otherBucket => $buckets[0] } if ($buckets[1] == $goal);
        $steps++;
    }
}

1;
