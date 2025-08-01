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
    die 'buffer empty' unless (scalar(@{$self->{'buffer'}}));
    return shift(@{$self->{'buffer'}});
}

sub clear($self) {
    $self->{'buffer'} = [];
}

sub overwrite($self, $item) {
    shift(@{$self->{'buffer'}})  if (scalar(@{$self->{'buffer'}}) == $self->{'capacity'});
    push(@{$self->{'buffer'}}, $item);
}

1;
