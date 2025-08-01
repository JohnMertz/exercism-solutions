package Say;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<say_number>;

our @suffixes = ( '', ' thousand ', ' million ', ' billion ' );
our @ones = ('', 'one', 'two', 'three', 'four', 
    'five', 'six', 'seven', 'eight', 'nine');
our @teens = ('ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
    'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen');
our @tens = ('', undef, 'twenty', 'thirty', 'forty',
    'fifty', 'sixty', 'seventy', 'eighty', 'ninety');

sub say_number {
    my ($number) = @_;
    die "input out of range" unless ($number =~ m/^\d{1,12}$/);
    return 'zero' unless ($number);
    
    # Split into 3 digit blocks, from right
    my @nums = split('', $number);
    my @blocks;
    my $current = '';
    while (scalar(@nums)) {
        $current = pop(@nums) . $current;
        if (length($current) == 3) {
            push(@blocks, $current);
            $current = '';
        }
    }
    push(@blocks, $current) if ($current);

    # Feed blocks to to_text from largest to smallest
    my $ret = '';
    foreach (1 .. scalar(@blocks)) {
        my $block = to_text($blocks[scalar(@blocks)-$_]);
        $ret .= $block . $suffixes[scalar(@blocks)-$_] if ($block);
    }
    # Input divisible by 100 will have a trailing space, remove it
    $ret =~ s/\s$//g; 
    return $ret;
}

# Each 3 digit block has identical formatting until the suffix word is appended
sub to_text {
    my $num = shift;
    # Expects three digits, so split with leading zeros
    my @digits = split('', sprintf("%03d", $num));
    # Unless 0th digit is 0, include 'N hundred '
    return ($digits[0] ? $ones[$digits[0]] . " hundred " : '') . 
        # Special case for 1st digit being 1, get 'teen' text for 2nd digit
        ($digits[1] == 1 ? $teens[$digits[2]] :
            # Otherwise, unless 1st digit is 0, include '$tens' text
            ($digits[1] ? $tens[$digits[1]] . 
                # ... plus the 2nd digit
                ( $digits[2] ? '-'.$ones[$digits[2]] : '' )
                # Otherwise just the 2nd digit (unless 0)
                : ($digits[2] ? $ones[$digits[2]] : '')
            )
        );
}

1;
