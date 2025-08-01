package GradeSchool;

use v5.38;

sub new($class) {
    return bless { 'grades' => {} }, $class;
}

sub add($self,$student,$grade) {
    return 0 if (grep(/^$student$/, @{$self->roster()}));
    push(@{$self->{'grades'}->{$grade}}, $student);
}

sub roster($self,$grade=undef) {
    return [ ] unless (scalar(keys(%{$self->{'grades'}})));
    if (defined($grade)) {
        return [ sort(@{$self->{'grades'}->{$grade}}) ] if (defined($self->{'grades'}->{$grade}));
	return [ ];
    }
    my @ret;
    foreach (sort(keys(%{$self->{'grades'}}))) {
        push(@ret, sort(@{$self->{'grades'}->{$_}}));
    }
    return \@ret;
}

1;
