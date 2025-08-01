package SpiralMatrix;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<spiral_matrix>;

sub spiral_matrix ($size) {
    return [] unless ($size);
    my ($y, $i, $matrix) = (0, 1, [[]]);
    $matrix = [ [], @{inner_matrix($matrix, $size-2)}, [] ]  if ($size > 2);
    do {{
        if ($y == 0) {
            unless (scalar(@{$matrix->[$y]}) < $size) {
                push(@{$matrix}, []) unless (defined($matrix->[++$y]));
                next;
            }
            push(@{$matrix->[$y]}, $i);
        } elsif ($y == $size-1) {
            unless (scalar(@{$matrix->[$y]}) < $size) {
                $y--;
                next;
            }
            unshift(@{$matrix->[$y]}, $i);
        } elsif (scalar(@{$matrix->[$y]}) < ($size-1)) {
            push(@{$matrix->[$y++]}, $i);
        } else {
            unshift(@{$matrix->[$y--]}, $i);
        }
        $i++;
    }} while ($i <= ($size-1)*4);
    return $matrix;
}

sub inner_matrix ($matrix, $size) {
    $matrix = spiral_matrix($size);
    for my $y (0..$size-1) {
        $matrix->[$y]->[$_] += ($size+1)*4 for (0..$size-1);
    }
    return $matrix;
}

1;
