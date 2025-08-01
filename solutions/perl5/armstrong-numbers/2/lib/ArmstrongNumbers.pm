package ArmstrongNumbers;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub is_armstrong_number ($number) {
    my @digits = split(//, $number);
    map { $number -= (0+$_)**scalar(@digits) } @digits;
    return $number ? 0 : 1;
}

1;
