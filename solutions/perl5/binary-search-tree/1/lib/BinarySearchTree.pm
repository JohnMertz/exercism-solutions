package BinarySearchTree;

use v5.38;

sub new($class='BinarySearchTree', %args) {
    return bless \%args, $class;
}

package BinarySearchTree::Node {
    sub new($class='BinarySearchTree::Node', %data) {
        return bless { 'data' => $data{'data'}, 'left' => undef, 'right' => undef }, $class;
    }

    sub sort ($self) {
        return [
            (defined($self->{'left'}) ? @{$self->{'left'}->sort()} : ()), 
            $self->{'data'},
            (defined($self->{'right'}) ? @{$self->{'right'}->sort()} : ())
        ];
    }

    sub add($self, $i) {
        if ($i < $self->{'data'}) {
            if (defined($self->{'left'})) {
                $self->{'left'}->add($i);
            } else {
                $self->{'left'} = new('BinarySearchTree::Node', 'data' => $i);
            }
        } elsif ($i => $self->{'data'}) {
            if (defined($self->{'right'})) {
                $self->{'right'}->add($i);
            } else {
                $self->{'right'} = new('BinarySearchTree::Node', 'data' => $i);
            }
        }
    }
};

sub add($self, $i) {
    $self->{'root'}->add($i);
}
    
sub sort ($self) {
    return $self->{'root'}->sort();
}

1;
