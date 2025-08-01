package SpaceAge;

use v5.38;
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

sub age_on_planet($planet, $seconds) {
    die 'not a planet' unless(defined($planet) && defined($planet_year{lc($planet)}));
    return sprintf("%.2f",$seconds/($planet_year{lc($planet)}*31557600));
}

1;
