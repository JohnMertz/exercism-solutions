package CollatzConjecture;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<steps>;

sub steps ($number) {
    my $steps = 0;
    die "Only positive integers are allowed" unless ($number > 0);
    while ($number != 1) {
        $steps++;
        $number = ($number % 2 ? ($number*3)+1 : $number/2);
    }
    return $steps;
}

1;
