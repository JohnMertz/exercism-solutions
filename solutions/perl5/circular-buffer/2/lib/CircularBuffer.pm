use v5.40;

package CircularBuffer;

sub new($class, %args) {
    return bless {'buffer' => [], %args}, $class;
}

sub write($self, $item) {
    die "buffer full" if (scalar(@{$self->{'buffer'}}) == $self->{'capacity'});
    push(@{$self->{'buffer'}}, $item);
}

sub read($self) {
    return shift(@{$self->{'buffer'}}) || die 'buffer empty';
}

sub clear($self) {
    $self->{'buffer'} = [];
}

sub overwrite($self, $item) {
    $self->read() if (scalar(@{$self->{'buffer'}}) == $self->{'capacity'});
    $self->write($item);
}

1;
