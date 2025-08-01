package ArmstrongNumbers;

use v5.40;

use bigint;
use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub is_armstrong_number ($number) {
    my @digits = split(//, $number);
    $number -= (0+$_) ** scalar(@digits) for @digits;
    return $number ? false : true;
}

1;
