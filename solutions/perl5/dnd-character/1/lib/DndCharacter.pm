use v5.40;

package DndCharacter;

sub new($class) {
    my $ref = bless { 
        strength => ability($class),
        dexterity => ability($class),
        constitution => ability($class),
        intelligence => ability($class),
        wisdom => ability($class),
        charisma => ability($class),
    }, $class;
    $ref->{hitpoints} = 10 + $ref->modifier($ref->{constitution});
    return $ref;
}

sub ability ($self) {
    my @dice = ();
    for (0..3) {
        my $i = int(rand(6))+1;
        if (defined($dice[0]) && $i < $dice[0]) {
            unshift(@dice, $i);
        } else {
            push(@dice, $i);
        }
    }
    return eval join '+', @dice[1..3];
}

sub modifier ($self, $constitution) {
    return int($constitution/2)-5;
}

sub strength($self) {
    return $self->{strength};
}

sub dexterity($self) {
    return $self->{dexterity};
}

sub constitution($self) {
    return $self->{constitution};
}

sub intelligence($self) {
    return $self->{intelligence};
}

sub wisdom($self) {
    return $self->{wisdom};
}

sub charisma($self) {
    return $self->{charisma};
}

sub hitpoints($self) {
    return $self->{hitpoints};
}

1;
