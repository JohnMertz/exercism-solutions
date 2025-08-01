use v5.38;

package Robot;

our @compass = ( 'north', 'east', 'south', 'west' );

sub new($class, %args) {
    $args{'x'} //= 0;
    $args{'y'} //= 0;
    $args{'compass'} = [ 'north', 'east', 'south', 'west' ];
    my $robot = bless \%args, $class;
    $robot->_orient($args{'direction'});
    return $robot;
}

sub direction($self) {
    return $self->{'direction'};
}

sub x($self) {
    return $self->{'x'};
}

sub y($self) {
    return $self->{'y'};
}

sub _orient($self, $direction) {
    $self->rotate_right() until ($self->{'compass'}->[0] eq $direction);
}

sub rotate_right($self) {
    push(@{$self->{'compass'}}, shift(@{$self->{'compass'}}));
    $self->{'direction'} = $self->{'compass'}[0];
}

sub rotate_left($self) {
    unshift(@{$self->{'compass'}}, pop(@{$self->{'compass'}}));
    $self->{'direction'} = $self->{'compass'}[0];
}

sub enact($self, $abbreviation) {
    foreach (split('', $abbreviation)) {
        $self->rotate_right() if ($_ eq 'R');
        $self->rotate_left() if ($_ eq 'L');
        $self->advance() if ($_ eq 'A');
    }
    return $self;
}

sub advance($self) {
    $self->{'y'}++ if ($self->{'direction'} eq 'north');
    $self->{'x'}++ if ($self->{'direction'} eq 'east');
    $self->{'y'}-- if ($self->{'direction'} eq 'south');
    $self->{'x'}-- if ($self->{'direction'} eq 'west');
    return undef;
}

1;
