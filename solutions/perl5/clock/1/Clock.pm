package Clock;

use POSIX qw( floor );
use feature qw<say>;

# Moo is entirely unnecessary for such a simple program. 
sub new {
    my $class = shift;
    my %args = @_;

    my $self = ();
    $self->{$_} = $args{$_} foreach (keys(%args));
    normalize($self);
    bless $self, $class;
    return $self;
}

sub time {
    my ($self) = @_;
    return undef unless (defined($self->{hour} && defined($self->{minute})));
    return sprintf("%02d:%02d", $self->{hour}, $self->{minute});
}

sub add_minutes {
    my ( $self, $amount ) = @_;
    $self->{minute} += $amount;
    $self->normalize();
    return $self;
}

sub subtract_minutes {
    my ( $self, $amount ) = @_;
    return $self->add_minutes(-$amount);
}

sub normalize {
    my $self = shift;
    $self->{hour} = ($self->{hour}+floor($self->{minute}/60))%24;
    $self->{minute} = $self->{minute}%60;
}

1;
