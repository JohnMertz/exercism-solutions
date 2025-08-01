package SpiralMatrix;

use v5.40;

use Exporter qw<import>;
use Data::Dump qw<dump>;
our @EXPORT_OK = qw<spiral_matrix>;

sub spiral_matrix ($size) {
    return [] unless ($size);
    my ($y, $i, $matrix) = (0, 1, [[]]);
    # All inner matrices are self similar to outer, this will generate them recursively
    if ($size > 2) {
        $matrix = inner_matrix($matrix, $size-2);
        # Initialize new top and bottom rows
        unshift(@{$matrix}, []);
        push(@{$matrix}, []);
    }
    # Must run once for 1, it is easier to force this with do-while than create an exception to the while condition
    do {{
        if ($y == 0) {
            # Fill in top row from the left
            if (scalar(@{$matrix->[$y]}) < $size) {
                push(@{$matrix->[$y]}, $i);
            # Advance to the next row when top is full (and create it if it does not exist)
            # No number was written, so use `next` to avoid incrementing
            } else {
                $y++;
                push(@{$matrix}, []) unless (defined($matrix->[$y]));
                next;
            }
        } elsif ($y == $size-1) {
            # Fill in bottom row from the right
            if (scalar(@{$matrix->[$y]}) < $size) {
                unshift(@{$matrix->[$y]}, $i);
            # Retreat to previous row once bottom is full; preserve $i with `next`.
            } else {
                $y--;
                next;
            }
        } else {
            # If middle row is short 2 elements, append and advance to next row (right edge)
            if (scalar(@{$matrix->[$y]}) < ($size-1)) {
                push(@{$matrix->[$y]}, $i);
                $y++;
            # Otherwise prepend and retreat to previous row (left edge)
            } else {
                unshift(@{$matrix->[$y]}, $i);
                $y--;
            }
        }
        $i++;
    }} while ($i <= ($size-1)*4);
    return $matrix;
}

sub inner_matrix ($matrix, $size) {
    $matrix = spiral_matrix($size);
    # Increment all current values by the highest number in the outer ring.
    for (my $y = 0; $y < $size; $y++) {
        for (my $x = 0; $x < $size; $x++) {
            $matrix->[$y]->[$x] += ($size+1)*4;
        }
    }
    return $matrix;
}

1;
