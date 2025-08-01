package Bob;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey($msg) {
    my $special = "'\%\^\*\\\@\#\$\(\)\!\.\,: ";
    return "Fine. Be that way!" if ($msg =~ m/^\s*$/);
    return "Calm down, I know what I'm doing!" if ($msg =~ m/^[\p{Upper}\p{Number}$special]+\?\s*$/ && ($msg =~ m/\p{Upper}/));
    return "Sure." if ($msg =~ m/^[\p{Alpha}\p{Number}$special]+\?\s*$/);
    return "Whoa, chill out!" if ($msg =~ m/^[\p{Upper}\p{Number}$special]+$/ && $msg =~ m/\p{Upper}/);
    return "Whatever.";
}

1;
