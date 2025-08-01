# there are 2 packages in this file; separate them once multiple files are supported

use strict;
use warnings;
use feature "switch";

{

    package Robot;

    our %compass = ( 'north' => 0, 'east' => 1, 'south' => 2, 'west' => 3 );

    sub new {
        my ($class, %args) = @_;
        return bless \%args, $class;
    }

    sub bearing {
        my $self = shift;
        foreach (keys(%compass)) {
            return $_ if ($self->{'bearing'} == $compass{$_});
        }
    }

    sub coordinates {
        my $self = shift;
        return [$self->{'x'}, $self->{'y'}] if (defined($self->{'x'}) && defined($self->{'y'}));
        return undef;
    }

    sub orient {
        my ( $self, $direction ) = @_;
        die "ArgumentError" unless (grep { /^$direction$/ } keys(%compass));
        $self->{'bearing'} = $compass{$direction};
    }

    sub turn_right {
        my $self = shift;
        $self->{'bearing'} = ($self->{'bearing'}+1)%4;
    }

    sub turn_left {
        my $self = shift;
        $self->{'bearing'} = ($self->{'bearing'}-1)%4;
    }

    sub at {
        my $self = shift;
        $self->{'x'} = shift;
        $self->{'y'} = shift;
    }

    sub advance {
        my $self = shift;
        given ($self->{'bearing'}) {
            when(0) { $self->{'y'}++; }
            when(1) { $self->{'x'}++; }
            when(2) { $self->{'y'}--; }
            when(3) { $self->{'x'}--; }
            default { die "Invalid bearing"; }
        }
        return undef;
    }

    1;
}    # end of Package Example;

{

    package Simulator;

    sub new {
        my ($class, %args) = @_;
        return bless \%args, $class;
    }

    sub place {
        my ( $self, $robot, $options ) = @_;
        $robot->at($options->{'x'}, $options->{'y'}) if (defined($options->{'x'}) && defined($options->{'y'}));
        $robot->orient($options->{'direction'}) if (defined($options->{'direction'}));
    }

    sub evaluate {
        my ( $self, $robot, $abbreviation ) = @_;
        foreach (split('', $abbreviation)) {
            given ($_) {
                when ('R') { $robot->turn_right(); }
                when ('L') { $robot->turn_left(); }
                when ('A') { $robot->advance(); }
                default { die "ArgumentError" }
            }
        }
    }

    sub instructions {
        my ( $self, $abbreviation ) = @_;
        my @ret;
        foreach (split('', $abbreviation)) {
            given ($_) {
                when ('R') { push(@ret, 'turn_right'); }
                when ('L') { push(@ret, 'turn_left'); }
                when ('A') { push(@ret, 'advance'); }
                default { die "ArgumentError" }
            }
        }
        return \@ret;
    }
}

1;
