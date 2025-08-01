package PhoneNumber;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<clean_number>;

sub clean_number {
    my ($number) = @_;
    my @digits = $number =~ m/\d/g;
    die "letters not permitted" if ($number =~ m/[a-zA-Z]/);
    die "punctuations not permitted" if ($number =~ m/[^\s\d\w\(\)\.\-\+]/);
    die "incorrect number of digits" if (scalar(@digits) < 10);
    die "more than 11 digits" if (scalar(@digits) > 11);
    if (my ($cc, $ac, $ec, $ln) = $number =~ m/\s*\+?(\d?) *\(?(\d{3})\)?[\ \-\.]*(\d{3})[\ \-\.]*(\d{4})\s*/ ) {
        die "11 digits must start with 1" if ($cc ne '' && $cc != 1);
        die "area code cannot start with zero" if (substr($ac,0,1) == 0);
        die "area code cannot start with one" if (substr($ac,0,1) == 1);
        die "exchange code cannot start with zero" if (substr($ec,0,1) == 0);
        die "exchange code cannot start with one" if (substr($ec,0,1) == 1);
        return $ac.$ec.$ln;
    }
}

1;
