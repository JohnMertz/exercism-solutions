package PascalsTriangle;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<pascal_rows>;

sub pascal_rows($rows) {
    return '' if ($rows < 1);
    my @last = my @ret = ( 1 );
    while (scalar(@ret) < $rows) {
        @last = @{row(@last)};
        push(@ret, join(' ',@last));
    }
    return join("\n", @ret);
}

sub row(@prev) {
    my ($right, $left, @ret) = (0);
    while (scalar(@prev)) {
        $left = $right;
        $right = shift(@prev);
        push(@ret, $left+$right);
    }
    return [ @ret, 1 ];
}

1;
