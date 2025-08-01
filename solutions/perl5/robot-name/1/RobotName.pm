package RobotName;

use strict;
use warnings;
use POSIX;

our %existing;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub _number {
    return int rand(10);
}

sub _letter {
    return chr(65 + int rand(26));
}

sub name {
    my $self = shift;
    return $self->{'name'} if (defined($self->{'name'}));
    return $self->reset_name();
}

sub reset_name {
    my ($self) = @_;
    my $name;
    until ($name) {
        $name = _letter() . _letter() . _number() . _number() . _number();
        if (defined($existing{$name})) {
            $name = undef;
        } else {
            $existing{$name} = 1;
        }
    }
    $self->{'name'} = $name;
    return $name;
}

1;
