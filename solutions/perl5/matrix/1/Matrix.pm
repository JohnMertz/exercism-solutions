package Matrix;

use feature qw<say>;

sub new {
    my $class = shift;
    return bless { @_ }, $class;
}

sub row {
    my ( $self, $index ) = @_;
    return [ split(' ', (split(/\n/, $self->{'string'}))[$index-1]) ];
}

sub column {
    my ( $self, $index ) = @_;
    $index--;
    return [ map { $_ =~ m/(?:\d+\s*){$index}(\d+)[^\n]*\n?/ } split(/\n/, $self->{'string'}) ];
}

1;
