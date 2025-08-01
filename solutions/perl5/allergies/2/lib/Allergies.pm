package Allergies;

use strict;
use warnings;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

our %allergens = (
    'eggs' => sub {
        return ($_[0] & 0b00000001);
    },
    'peanuts' => sub {
        return ($_[0] & 0b00000010);
    },
    'shellfish' => sub {
        return ($_[0] & 0b00000100);
    },
    'strawberries' => sub {
        return ($_[0] & 0b00001000);
    },
    'tomatoes' => sub {
        return ($_[0] & 0b00010000);
    },
    'chocolate' => sub {
        return ($_[0] & 0b00100000);
    },
    'pollen' => sub {
        return ($_[0] & 0b01000000);
    },
    'cats' => sub {
        return ($_[0] & 0b10000000);
    }
);

sub allergic_to {
    my ( $item, $score ) = @_;
    return 0 unless defined($allergens{$item});
    return 1 if $allergens{$item}($score);
    return 0;
}

sub list_allergies {
    my ($score) = @_;
    my @list;
    foreach(keys(%allergens)) {
        push(@list, $_) if allergic_to($_, $score);
    }
    return \@list;
}

1;
