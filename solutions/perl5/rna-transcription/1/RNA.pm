package RNA;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna {
    my ($dna) = @_;
    my %complement = ( 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' );
    return join('', ( map { $complement{$_} } (split('', $dna))));
}

1;
