<?php

declare(strict_types=1);

function meetup_day(int $year, int $month, string $which, string $weekday): DateTimeImmutable
{
    $dt = new DateTime("$year/$month/1");
    while ($dt->format("l") != $weekday)$dt->add(new DateInterval("P1D"));
    if ($which == "first") return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    $dt->add(new DateInterval("P7D"));
    if ($which == "teenth" && $dt->format("d") >= "13") return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    if ($which == "second") return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    $dt->add(new DateInterval("P7D"));
    if ($which == "third") return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    if ($which == "teenth" && $dt->format("d") <= "19") return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    $dt->add(new DateInterval("P7D"));
    $fourth = "$year/$month/".$dt->format("d");
    if ($which == "fourth") return new DateTimeImmutable($fourth);
    $dt->add(new DateInterval("P7D"));
    if ($dt->format("m") == $month) return new DateTimeImmutable("$year/$month/".$dt->format("d"));
    return new DateTimeImmutable($fourth);
}
