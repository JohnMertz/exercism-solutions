package Yacht;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score>;

use Yacht::Category;

sub score ( $dice, $category ) {
    return _yacht($dice) if ($category eq $Yacht::Category::YACHT);
    return _count($dice, 1) if ($category eq $Yacht::Category::ONES);
    return _count($dice, 2) if ($category eq $Yacht::Category::TWOS);
    return _count($dice, 3) if ($category eq $Yacht::Category::THREES);
    return _count($dice, 4) if ($category eq $Yacht::Category::FOURS);
    return _count($dice, 5) if ($category eq $Yacht::Category::FIVES);
    return _count($dice, 6) if ($category eq $Yacht::Category::SIXES);
    return _full_house($dice) if ($category eq $Yacht::Category::FULL_HOUSE);
    return _four_of_a_kind($dice) if ($category eq $Yacht::Category::FOUR_OF_A_KIND);
    return _straight($dice,1) if ($category eq $Yacht::Category::BIG_STRAIGHT);
    return _straight($dice,0) if ($category eq $Yacht::Category::LITTLE_STRAIGHT);
    return _choice($dice) if ($category eq $Yacht::Category::CHOICE);
    return undef;
}

sub _yacht($dice) {
    my $i = shift(@{$dice});
    map { return 0 unless $_ == $i } @$dice;
    return 50;
}

sub _count($dice, $number) {
    return grep(/$number/, @{$dice})*$number;
}

sub _full_house($dice) {
    my ($threes, $twos) = (0,0);
    for (1..6) {
        $threes += 3*$_ if (_count($dice, $_) == 3*$_);
        $twos += 2*$_ if (_count($dice, $_) == 2*$_);
    }
    return 0 unless $threes && $twos ;
    return $threes+$twos;
}

sub _four_of_a_kind($dice) {
    for (1..6) {
        return 4*$_ if (_count($dice, $_) >= 4*$_);
    }
    return 0;
}

sub _straight($dice, $big) {
    for my $i (1+$big..5+$big) {
        return 0 unless grep(/$i/, @{$dice});
    }
    return 30;
}

sub _choice($dice, $sum=0) {
    map { $sum += $_ } @{$dice};
    return $sum;
}

1;
