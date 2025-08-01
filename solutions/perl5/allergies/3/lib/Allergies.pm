package Allergies;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

our %allergens = (
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
);

sub allergic_to ($item, $score) {
    return 1 if (defined($allergens{$item}) && $allergens{$item} & $score);
}

sub list_allergies ($score) {
    my @list;
    allergic_to($_, $score) && push(@list, $_) foreach (keys(%allergens));
    return \@list;
}

1;
