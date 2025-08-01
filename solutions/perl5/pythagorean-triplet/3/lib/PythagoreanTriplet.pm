package PythagoreanTriplet;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<triplets_with_sum>;

sub triplets_with_sum($sum) {
    my($a, $b, $c, @ret) = (1);
    while ($a < $sum/2) {
        $b = $a;
        while ($a+$b < $sum) {
            $c = $b;
            while ($a+$b+$c <= $sum) {
                push(@ret,[$a,$b,$c]) if ($a+$b+$c == $sum && $a*$a+$b*$b == $c*$c);
                $c++;
            }
            $b++;
        }
        $a++;
    }
    return \@ret;
}
    
