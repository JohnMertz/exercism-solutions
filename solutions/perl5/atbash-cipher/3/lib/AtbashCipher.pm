package AtbashCipher;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub _lookup($ret_ref, $letter) {
    if ($letter =~ m/[\d]/) {
        $$ret_ref .= $letter;
        return 1;
    } elsif ($letter =~ m/\w/) {
        $$ret_ref .= chr(122-ord(lc($letter))+97);
        return 1;
    }
    return 0;
}

sub decode_atbash($phrase) {
    my $ret = "";
    my $ret_ref = \$ret;
    _lookup($ret_ref, $_) foreach (split('',$phrase));
    return $ret;
}

sub encode_atbash($phrase) {
    my $ret = "";
    my $ret_ref = \$ret;
    my $counter = 0;
    foreach (split('',$phrase)) {
        # Add space after every 5th character
        if ($counter == 5) {
            $ret .= ' ';
            $counter = 0;
        }
        # Count only valid characters
        $counter++ if (_lookup($ret_ref, $_));
    }
    # Remove trailing whitespace
    $ret =~ s/\s+$//;
    return $ret;
}

1;
