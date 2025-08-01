package PascalsTriangle;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<pascal_rows>;

sub pascal_rows {
    my ($rows) = @_;
    return '' if ($rows < 1);
    my @last = my @ret = ( 1 );
    while (scalar(@ret) < $rows) {
        @last = @{row(@last)};
        push(@ret, join(' ',@last));
    }
    return join("\n", @ret);
}

sub row {
    my @prev = @_;
    my ($right, $left, @ret) = (0);
    while (scalar(@prev)) {
        $left = $right;
        $right = shift(@prev);
        push(@ret, $left+$right);
    }
    return [ @ret, 1 ];
}

1;
