package Say;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<say_number>;

our @suffixes = ( '', ' thousand', ' million', ' billion' );
our @ones = ('', 'one', 'two', 'three', 'four', 
    'five', 'six', 'seven', 'eight', 'nine');
our @teens = ('ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
    'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen');
our @tens = ('', undef, 'twenty', 'thirty', 'forty',
    'fifty', 'sixty', 'seventy', 'eighty', 'ninety');

sub say_number($number) {
    die "input out of range" unless ($number =~ m/^\d{1,12}$/);
    return 'zero' unless ($number);
    
    my @blocks = sprintf("%012s",$number) =~ m/(\d{3})/g;
    shift(@blocks) until ($blocks[0] gt '000');

    my @ret;
    my $block = 0;
    foreach (reverse(@blocks)) {
	unshift(@ret, to_text($_) . $suffixes[$block]) if ($_ ne '000');
	$block++;
    }

    return join(' ',@ret);
}

sub to_text($num) {
    my @digits = split('', sprintf("%03d", $num));
    my @ret;
    push(@ret, $ones[$digits[0]] . " hundred") if ($digits[0]);
    push(@ret, 
        ($digits[1] == 1 ? $teens[$digits[2]] :
            ($digits[1] ? $tens[$digits[1]] . 
                ( $digits[2] ? '-'.$ones[$digits[2]] : '' )
                : ($digits[2] ? $ones[$digits[2]] : '')
            )
        )
    ) if ($digits[1] || $digits[2]);
    return join(' ', @ret);
}

1;
