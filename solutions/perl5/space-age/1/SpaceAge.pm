package SpaceAge;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<age_on_planet>;

our %planet_year = (
    'mercury'   => 0.2408467,
    'venus'     => 0.61519726,
    'earth'     => 1.0,
    'mars'      => 1.8808158,
    'jupiter'   => 11.862615,
    'saturn'    => 29.447498,
    'uranus'    => 84.016846,
    'neptune'   => 164.79132,
);

sub age_on_planet {
    my ($args) = @_;
    return 0 unless(defined($args->{planet}) && defined($planet_year{lc($args->{planet})}));
    return sprintf("%.2f",$args->{seconds}/($planet_year{lc($args->{planet})}*31557600));
}

1;
