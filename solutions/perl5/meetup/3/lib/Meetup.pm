package Meetup;

use v5.40;
use Exporter qw<import>;
our @EXPORT_OK = qw<meetup>;
use DateTime;

our %months = qw( january 1 february 2 march 3 april 4 may 5 june 6 july 7 august 8 september 9 october 10 november 11 december 12 );

sub meetup($desc) {
    my ($count, $day, $month, $year) = $desc =~ m/(\w+) (\w+) of (\w+) (\d+)/;
    my $first_of_month = DateTime->new( year => $year, month => $months{lc($month)}, day => 1 );
    my $first = (({ 'monday' => '1', 'tuesday' => '2', 'wednesday' => '3', 'thursday' => '4', 'friday' => '5', 'saturday' => '6', 'sunday' => '7' }->{lc($day)}-($first_of_month->day_of_week()))%7)+1;
    return sprintf("%4d-%02d-%02d", $year, $months{lc($month)}, date_num($count, $first, $first_of_month));
}

sub date_num($count, $day, $first_of_month) {
    return $day if ($count eq 'First');
    return $day+7 if ($count eq 'Second');
    return $day+14 if ($count eq 'Third');
    return $day+21 if ($count eq 'Fourth');
    return $day+7 > 12 ? $day+7 : $day+14 if ($count eq 'Teenth');
    return $day+28 > $first_of_month->clone()->add( months => 1)->subtract( days => 1 )->day() ? $day+21 : $day+28;
}

1;
