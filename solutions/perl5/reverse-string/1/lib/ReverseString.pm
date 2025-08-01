package ReverseString;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<str_reverse>;

sub str_reverse ($text) {
    return join('', reverse $text =~ m/(\X)/g);
}

1;
