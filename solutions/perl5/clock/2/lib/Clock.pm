package Clock;

use POSIX qw( floor );
use v5.38;

sub new($class, %args) {
    my $self = ();
    $self->{$_} = $args{$_} foreach (keys(%args));
    normalize($self);
    bless $self, $class;
    return $self;
}

sub time($self) {
    return undef unless (defined($self->{hour} && defined($self->{minute})));
    return sprintf("%02d:%02d", $self->{hour}, $self->{minute});
}

sub add_minutes($self, $amount) {
    $self->{minute} += $amount;
    $self->normalize();
    return $self;
}

sub subtract_minutes($self, $amount) {
    return $self->add_minutes(-$amount);
}

sub normalize($self) {
    $self->{hour} = ($self->{hour}+floor($self->{minute}/60))%24;
    $self->{minute} = $self->{minute}%60;
}

1;
