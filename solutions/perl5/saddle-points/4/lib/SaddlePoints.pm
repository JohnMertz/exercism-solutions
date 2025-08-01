package SaddlePoints;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<saddle_points>;

sub saddle_points($matrix) {
    my @ret;
    for my $y (0..$#$matrix) {
        for my $x (0..$#{$matrix->[$y]}) {
            push(@ret, { 'column' => $x+1, 'row' => $y+1 }) if (
                highest($matrix->[$y]->[$x], @{$matrix->[$y]}) &&
                lowest($matrix->[$y]->[$x], map { $_->[$x] } @{$matrix})
            );
        }
    }
    return \@ret;
}

sub lowest($target, @list) {
    return 1 if (sort { $a<=>$b } @list)[0] == $target;
}

sub highest($target, @list) {
    return 1 if (sort { $b<=>$a } @list)[0] == $target;
}

1;
