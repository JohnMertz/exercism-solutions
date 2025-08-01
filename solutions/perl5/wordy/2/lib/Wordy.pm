package Wordy;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<answer>;

sub answer($question) {
    die "unknown operation" unless ($question =~ m/^What is(.*)/);
    my ($answer, @fields, $operation) = $1 =~ /(?:(?:\-?\d+)|(?:\w+(?: by)?))/g;
    die "syntax error" unless (defined($answer));
    while (scalar(@fields)) {
        $operation = shift(@fields) || die "syntax error";
	if ($operation eq 'plus') {
	    $answer = _plus($answer, shift(@fields)); 
	} elsif ($operation eq 'minus') {
	    $answer = _minus($answer, shift(@fields)); 
	} elsif ($operation eq 'multiplied by') {
	    $answer = _times($answer, shift(@fields)); 
	} elsif ($operation eq 'divided by') {
	    $answer = _divide($answer, shift(@fields));
	} elsif ($operation =~ m/^\-?\d+$/) {
	    die "syntax error"; 
	} else {
            die "unknown operation";
        }
    }
    return $answer;
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
