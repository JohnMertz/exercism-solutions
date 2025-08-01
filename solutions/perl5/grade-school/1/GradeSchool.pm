package GradeSchool;

use feature qw<say>;

sub new {
    my ($class) = @_;
    return bless [ ], $class;
}

sub add {
    my ( $self, $student, $grade ) = @_;
    return 0 if (grep(/^$student$/, @{$self->roster()}));
    push(@{$self->[0]->[$grade]}, $student);
}

sub roster {
    my ( $self, $grade ) = @_;
    my @ret;
    if (defined($grade)) {
        @ret = sort(@{$self->[0]->[$grade]});
    } else {
        push(@ret, sort(@{$_})) foreach (@{$self->[0]});
    }
    return \@ret;
}

1;
