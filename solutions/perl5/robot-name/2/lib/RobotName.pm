package RobotName;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<name>;
use POSIX;

our %existing;

sub new($class, %args) {
    return bless \%args, $class;
}

sub _number {
    return int rand(10);
}

sub _letter {
    return chr(65 + int rand(26));
}

sub name($self) {
    return $self->{'name'} if (defined($self->{'name'}));
    return $self->reset_name();
}

sub reset_name($self) {
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
