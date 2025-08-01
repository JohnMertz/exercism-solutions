package Triplet;

use strict;
use warnings;

sub new {
    my ( $class, @args ) = @_;
    my %self;
    return bless \%{$args[0]}, $class if ( scalar(@args) == 1 );
    return bless {'a' => shift(@args), 'b' => shift(@args),'c' => shift(@args)}, $class;
}

sub is_pythagorean {
    my $self = shift;
    return 1 if (($self->{'a'}**2)+($self->{'b'}**2) == ($self->{'c'}**2));
}

sub sum {
    my $self = shift;
    return $self->{'a'} + $self->{'b'} + $self->{'c'};
}

sub product {
    my $self = shift;
    return $self->{'a'} * $self->{'b'} * $self->{'c'} if (defined($self->{'a'}));
}

sub products {
    my $self = shift;
    my @ret;
    for ($self->{'a'} = $self->{'min_factor'} || 1; $self->{'a'} <= $self->{'max_factor'}-2; $self->{'a'}++) {
        for ($self->{'b'} = $self->{'a'}+1; $self->{'b'} <= $self->{'max_factor'}-1; $self->{'b'}++) {
            for ($self->{'c'} = $self->{'b'}+1; $self->{'c'} <= $self->{'max_factor'}; $self->{'c'}++) {
                last if (defined($self->{'sum'}) && $self->sum() > $self->{'sum'});
                next if (defined($self->{'sum'}) && $self->sum() < $self->{'sum'});
                push(@ret, $self->product()) if $self->is_pythagorean();
            }
        }
    } 
    return \@ret;
}

1;
