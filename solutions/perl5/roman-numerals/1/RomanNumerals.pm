package RomanNumerals;

use strict;
use warnings;
use feature qw<switch>;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_roman>;

sub to_roman {
    my ($number) = @_;
    my ($ref, @ret) = \$number;
    push(@ret, subtract($ref)) while ($number);
    return join('', @ret);
}

sub subtract {
    my $number = shift;
    if ($$number >= 1000) {
        $$number -= 1000;
        return 'M';
    } elsif ($$number >= 900) {
        $$number -= 900;
        return ('C', 'M');
    } elsif ($$number >= 500) {
        $$number -= 500;
        return 'D';
    } elsif ($$number >= 400) {
        $$number -= 400;
        return ('C', 'D');
    } elsif ($$number >= 100) {
        $$number -= 100;
        return 'C';
    } elsif ($$number >= 90) {
        $$number -= 90;
        return ('X', 'C');
    } elsif ($$number >= 50) {
        $$number -= 50;
        return 'L';
    } elsif ($$number >= 40) {
        $$number -= 40;
        return ('X', 'L');
    } elsif ($$number >= 10) {
        $$number -= 10;
        return 'X';
    } elsif ($$number == 9) {
        $$number -= 9;
        return ('I', 'X');
    } elsif ($$number >= 5) {
        $$number -= 5;
        return 'V';
    } elsif ($$number == 4) {
        $$number = 0;
        return ('I', 'V');
    } else {
        my $ret = ('I'x$$number);
        $$number = 0;
        return $ret;
    }
}

1;
