package MicroBlog;

use v5.40;
use Encode qw(decode);

use Exporter qw<import>;
our @EXPORT_OK = qw<truncate_post>;

sub truncate_post ($utf8_bytes) {
    return substr(decode('UTF-8', $utf8_bytes, Encode::FB_CROAK), 0, 5);
}

1;
