package Queen;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<can_attack>;

sub new($class, %data) {
    die "column not on board" if ($data{'column'} < 0 || $data{'column'} > 7);
    die "row not on board" if ($data{'row'} < 0 || $data{'row'} > 7);
    return bless \%data, $class;
}

sub can_attack($self, $target) {
    return 1 if (
	$self->{'row'} == $target->{'row'} ||
    	$self->{'column'} == $target->{'column'} ||
        abs($self->{'row'} - $target->{'row'}) == abs($self->{'column'} - $target->{'column'}) 
    );
}

1;

