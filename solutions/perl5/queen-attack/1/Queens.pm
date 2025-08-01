package Queens;
use strict;
use warnings;

sub new {
    my ( $class, %data ) = @_;
    $data{'white'} = [0, 3] unless defined ($data{'white'});
    $data{'black'} = [7, 3] unless defined ($data{'black'});
    die "ArgumentError" if (
        scalar(keys(%data)) > 2 ||
        $data{'white'}[0] > 7 || $data{'white'}[1] > 7 ||
        $data{'black'}[0] > 7 || $data{'black'}[1] > 7 ||
        $data{'white'}[0] < 0 || $data{'white'}[1] < 0 ||
        $data{'black'}[0] < 0 || $data{'black'}[1] < 0 ||
        ( $data{'white'}[0] == $data{'black'}[0] &&
        $data{'white'}[1] == $data{'black'}[1])
    );
    return bless \%data, $class;
}

sub white {
    my ($self) = @_;
    return [ $self->{'white'}->[0], $self->{'white'}->[1] ];
}

sub black {
    my ($self) = @_;
    return [ $self->{'black'}->[0], $self->{'black'}->[1] ];
}

sub to_string {
    my ($self) = @_;
    my $ret;
    for (my $y = 0; $y < 8; $y++) {
        my @row;
        for (my $x = 0; $x < 8; $x++) {
            if ($self->{'white'}->[0] == $y && $self->{'white'}->[1] == $x) {
                push(@row, "W");
            } elsif ($self->{'black'}->[0] == $y && $self->{'black'}->[1] == $x) {
                push(@row, "B");
            } else {
                push(@row, "O");
            }
        }
        $ret .= join(' ', @row)."\n";
    }
    return $ret;
}

sub can_attack {
    my ($self) = @_;
    return 1 if ($self->{'white'}->[0] == $self->{'black'}->[0]);
    return 1 if ($self->{'white'}->[1] == $self->{'black'}->[1]);
    return 1 if (
        abs($self->{'white'}->[0] - $self->{'black'}->[0]) ==
        abs($self->{'white'}->[1] - $self->{'black'}->[1])
    );
}

1;

