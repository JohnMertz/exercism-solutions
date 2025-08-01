package BookingUpForBeauty;

use v5.38;

# Suggested datetime modules you can use:
#use Time::Piece;
use Exporter ('import');
our @EXPORT_OK = qw( appointment_has_passed is_afternoon_appointment describe_appointment parse_datetime);

sub _parse_datetime($date_string) {
    return (qw(year month day hour minute second), ($date_string =~ m/(\d\d\d\d)\-(\d\d)\-(\d\d)T(\d\d):(\d\d):(\d\d)/))[0,6,1,7,2,8,3,9,4,10,5,11];
    return map { qw(year month day hour second) => $_ } $date_string =~ m/(\d{4})\-(\d\d)\-(\d\d)T(\d\d):(\d\d):(\d\d)/;
}

sub appointment_has_passed ($date_string) {
    my %time = _parse_datetime($date_string);
    my ($second, $minute, $hour, $day, $month, $year) = gmtime(time);
    return 1 if ($time{'year'} < $year+1900);
    return 0 if ($time{'year'} > $year+1900);
    return 1 if ($time{'month'} < $month+1);
    return 0 if ($time{'month'} > $month+1);
    return 1 if ($time{'day'} < $day);
    return 0 if ($time{'day'} > $day);
    return 1 if ($time{'hour'} < $hour);
    return 0 if ($time{'hour'} > $hour);
    return 1 if ($time{'minute'} < $minute);
    return 0 if ($time{'minute'} > $minute);
    return undef;
}

sub is_afternoon_appointment ($date_string) {
    my %time = _parse_datetime($date_string);
    return (11 < $time{'hour'} < 18);
}

sub describe_appointment ($date_string) {
    my %time = _parse_datetime($date_string);
    return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', $time{'month'}, $time{'day'}, $time{'year'}, ($time{'hour'} > 12 ? $time{'hour'}-12 : ( $time{'hour'} > 0 ? $time{'hour'} : '12') ), $time{'minute'}, ($time{'hour'} > 12 ? 'PM': 'AM') );
}

1;
