package Wordy;

use strict;
use warnings;
use feature qw<say switch>;

use Exporter qw<import>;
our @EXPORT_OK = qw<answer>;

sub answer {
    my ($question) = @_;
    if ($question =~ m/^What is (.*)\?/) {
        my ($answer, @fields, $operation) = $1 =~ /(?:(?:\-?\d+)|(?:\w+(?: by)?))/g;
        while (scalar(@fields)) {
            $operation = shift(@fields) || die "syntax error";
            given ($operation) {
                when ('plus') { $answer = _plus($answer, shift(@fields)); }
                when ('minus') { $answer = _minus($answer, shift(@fields)); }
                when ('multiplied by') { $answer = _times($answer, shift(@fields)); }
                when ('divided by') { $answer = _divide($answer, shift(@fields)); }
                when (/^\-?\d+$/) { die "syntax error"; }
                default { die "unknown operation"; }
            }
        }
        return $answer;
    }
    die "unknown operation" unless ($question =~ m/^What is/);
    die "syntax error";
}

sub _plus {
    die "syntax error" unless (defined($_[1]) && $_[1] =~ m/^\-?\d+$/);
    return shift(@_) + shift(@_);
}

sub _minus {
    die "syntax error" unless (defined($_[1]) && $_[1] =~ m/^\-?\d+$/);
    return shift(@_) - shift(@_);
}

sub _times {
    die "syntax error" unless (defined($_[1]) && $_[1] =~ m/^\-?\d+$/);
    return shift(@_) * shift(@_);
}

sub _divide {
    die "syntax error" unless (defined($_[1]) && $_[1] =~ m/^\-?\d+$/);
    die "Illegal divide by zero" if ($_[1] == 0);
    return shift(@_) / shift(@_);
}

1;
