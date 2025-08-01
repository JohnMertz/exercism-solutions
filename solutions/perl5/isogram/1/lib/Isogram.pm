package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

sub is_isogram ($phrase) {
    my %letters;
    foreach ($phrase =~ m/(\w)/g) {
        return 0 if (defined($letters{uc($_)}));
        $letters{uc($_)} = 1;
    }
    return 1;
}

1;
