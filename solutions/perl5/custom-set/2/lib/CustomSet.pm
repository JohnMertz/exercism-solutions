package CustomSet;

use v5.40;

sub new($class='CustomSet', %set) {
    return bless { 'elements' => [ @{$set{'elements'}} ] // [] }, $class;
}

sub is_empty ($self) {
    return !scalar(@{$self->{'elements'}});
}

sub contains ( $self, $element ) {
    return grep { $element eq $_ } @{$self->{'elements'}};
}

sub is_subset_of ( $self, $other ) {
    # A subset is just an intersection set which is the same size as the search set
    return scalar(@{$self->intersection($other)->{'elements'}}) == scalar(@{$self->{'elements'}});
}

sub is_disjoint_of ( $self, $other ) {
    # A disjoint is an intersection with zero elements.
    return ! @{$self->intersection($other)->{'elements'}};
}

sub is_equal_to ( $self, $other ) {
    # Equal sets have the same size and are complete intersections
    return (scalar(@{$self->intersection($other)->{'elements'}}) == scalar(@{$self->{'elements'}}) == scalar(@{$other->{'elements'}}));
}

sub add ( $self, $element ) {
    # Only add unique entries to set
    push(@{$self->{'elements'}}, $element) unless $self->contains($element);
    # Return object to support method calls during initialization (eg. CustomSet->new( ... )->add(1) ). I don't know what this idium is called...
    return $self;
}

sub intersection ( $self, $other ) {
    # Return new object, initialized with only elements contained in both
    return new('CustomSet', 'elements' => [ map { ( $other->contains($_) ? $_ : () ) } @{$self->{'elements'}} ] );
}

sub difference ( $self, $other ) {
    # Return new object, initialized with only elements contained in one 
    return new('CustomSet', 'elements' => [ map { ( $other->contains($_) ? () : $_ ) } @{$self->{'elements'}} ] );
}

sub union ( $self, $other ) {
    # A union is one of the original lists, plus the difference
    return new('CustomSet', 'elements' => [ @{$other->{'elements'}}, @{$self->difference($other)->{'elements'}} ] );
}

1;
