package Matrix;

use v5.38;

sub new($class, @args) {
    return bless { @args }, $class;
}

sub row($self, $index) {
    return [ split(' ', (split(/\n/, $self->{'string'}))[$index-1]) ];
}

sub column($self, $index) {
    $index--;
    return [ map { $_ =~ m/(?:\d+\s*){$index}(\d+)[^\n]*\n?/ } split(/\n/, $self->{'string'}) ];
}

1;
