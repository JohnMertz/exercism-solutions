package Matrix;

use strict;
use warnings;

sub new {
    my ( $class, $matrix_str ) = @_;
    my @raw_rows = split("\n", $matrix_str);
    my @matrix;
    foreach my $row (split("\n", $matrix_str)) { # Initialize matrix as 2D array
        push(@matrix, [ split(' ', $row) ]);
    }
    return bless { 'matrix' => \@matrix }, $class;
}

sub rows {
    my ( $self, $index ) = @_;
    return $self->{'matrix'}->[$index]; # Simply return array reference at index of first dimension
}

sub columns {
    my ( $self, $index ) = @_;
    return [ map { $_->[$index] } @{$self->{'matrix'}} ]; # Map indexes of second dimension to new array ref
}

sub saddle_points {
    my ($self, @ret) = shift;
    foreach my $row (0 .. scalar(@{$self->{'matrix'}})-1) { # Loop rows
        foreach my $column (0 .. scalar(@{$self->{'matrix'}->[$row]})-1) { # Loop columns
            push(@ret, [ $row, $column ]) if (
                $self->highest_in_row($row, $column, $self->{'matrix'}->[$row]->[$column]) &&
                $self->lowest_in_column($row, $column, $self->{'matrix'}->[$row]->[$column])
            ); # Found saddle point if highest_in_row and lowest_in_column
        }
    }
    return \@ret;
}

sub highest_in_row {
    my ($self, $row, $column, $value) = @_;
    my $r = $self->rows($row); # Fetch row to search
    foreach (0 .. scalar(@{$r})-1) { # Check all, using index so that we can...
        next if ($_ == $column); # ...ignore self
        return 0 if $value < $r->[$_]; # Bail if higher number is found
    }
    return 1; # If we made it here, we are the highest
}

sub lowest_in_column {
    my ($self, $row, $column, $value) = @_;
    my $c = $self->columns($column); # Column to search
    foreach (0 .. scalar(@{$c})-1) { # Check all, using index so that we can...
        next if ($_ == $row); # ...ignore self
        return 0 if $value > $c->[$_]; # Bail if lower number is found
    }
    return 1; # If we made it here, we are the lowest
}

1;
