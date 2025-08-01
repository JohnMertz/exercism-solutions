package RunLengthEncoding;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode decode>;

sub encode ($string) {
    my ($letter, $count, $ret) = ('', 0, '');;
    foreach (split(//, $string)) {
        if ($_ eq $letter) {
            $count++;
        } else {
            $ret .= ($count > 1 ? $count : '').$letter;
            ($letter, $count) = ($_, 1);
        }
    }
    return $ret . ($count > 1 ? $count : '').$letter;
}

sub decode ($string) {
    my ($count, $ret) = (0, '');
    foreach ($string =~ m/(\d+)?(\D)?/g) {
        next if (!defined($_));
        if ($_ =~ /\d+/) {
            $count = $_;
        } else {
            $ret .= $count ? $_ x $count : $_;
            $count = 0;
        }
    }
    return $ret;
}

1;
