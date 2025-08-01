package AtbashCipher;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub _lookup($ret, $letter) {
    return $$ret .= $letter if ($letter =~ m/[\d]/);
    return $$ret .= chr(122-ord(lc($letter))+97) if ($letter =~ m/\w/);
}

sub decode_atbash($phrase, $ret = '') {
    _lookup(\$ret, $_) foreach (split('',$phrase));
    return $ret;
}

sub encode_atbash($phrase, $ret = '', $counter = 0) {
    _lookup(\$ret, $_) && !(++$counter % 5) && ($ret .= ' ') foreach (split('',$phrase));
    return trim($ret);
}

1;
