package HelloWorld;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello {
    return 'Hello, World!';
}

1;
