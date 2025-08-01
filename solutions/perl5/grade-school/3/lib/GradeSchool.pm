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
    return [ map { sort(@{$self->{'grades'}->{$grade}}) } sort(keys(%{$self->{'grades'}})) ];
}

1;
