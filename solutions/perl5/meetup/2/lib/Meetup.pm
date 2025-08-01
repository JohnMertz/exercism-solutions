package Meetup;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<meetup>;
use DateTime;

our %months = (
    'january' => 1,
    'february' => 2,
    'march' => 3,
    'april' => 4,
    'may' => 5,
    'june' => 6,
    'july' => 7,
    'august' => 8,
    'september' => 9,
    'october' => 10,
    'november' => 11,
    'december' => 12,
);

our %dow = (
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6,
    'sunday' => 7,
);

sub meetup {
    my ($desc) = @_;
    my ($count, $day, $month, $year) = $desc =~ m/(\w+) (\w+) of (\w+) (\d+)/;
    my $first_of_month = DateTime->new( year => $year, month => $months{lc($month)}, day => 1 );
    my $last_of_month = $first_of_month->clone()->add( months => 1)->subtract( days => 1 );
    my $first = (($dow{lc($day)}-($first_of_month->day_of_week()))%7)+1;
    if ($count eq 'First') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, $first);
    } elsif ($count eq 'Second') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, $first+7);
    } elsif ($count eq 'Third') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, $first+14);
    } elsif ($count eq 'Fourth') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, $first+21);
    } elsif ($count eq 'Teenth') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, 
            $first+7 > 12 ? $first+7 : $first+14);
    } elsif ($count eq 'Last') {
        return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, 
            $first+28 > $last_of_month->day() ? $first+21 : $first+28);
    }
    return undef;
}

1;
