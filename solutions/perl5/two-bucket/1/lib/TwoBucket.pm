package TwoBucket;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<measure>;

sub measure ( $bucket_1, $bucket_2, $goal, $start_bucket ) {
    my ($steps, @buckets) = (1, 0, 0);
    # The code below is cleaner if we swap the buckets and restore at the end if not 'one')
    ($bucket_1, $bucket_2) = ($bucket_2, $bucket_1) unless ($start_bucket eq 'one');
    my %seen;
    while (1) {
        # Fill $start_bucket
        if ($buckets[0] == 0) {
            $buckets[0] = $bucket_1;
        # Fill other immediately if it satisfies goal
        } elsif ($bucket_2 == $goal) {
            $buckets[1] = $bucket_2;
        # Empty other if full
        } elsif ($buckets[1] == $bucket_2) {
            $buckets[1] = 0;
        } else {
            # Empty entirely into other if it fits
            if ($buckets[0] + $buckets[1] <= $bucket_2) {
                @buckets = (0, $buckets[0]+$buckets[1]);
            # Empty entirely partially into other if not
            } else {
                @buckets = ($buckets[0]-($bucket_2-$buckets[1]), $bucket_2);
            }
        }

        # Track all states that have been seen to know if we are stuck in a loop
        die "impossible" if (defined( $seen{$buckets[0]}{$buckets[1]} ));
        $seen{$buckets[0]}{$buckets[1]} = 1;

        # If either hit the goal, return (with correction for initial swap, if applicable)
        if ($buckets[0] == $goal) {
            return { goalBucket => $start_bucket, moves => $steps, otherBucket => $buckets[1] };
        } elsif ($buckets[1] == $goal) {
            return { goalBucket => ($start_bucket eq 'one' ? 'two' : 'one'), moves => $steps, otherBucket => $buckets[0] };
        } else {
            $steps++;
        }
    }
}

1;
