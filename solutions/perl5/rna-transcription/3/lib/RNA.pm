package RNA;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna($dna) {
    my %complement = ( 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' );
    return join('', ( map { $complement{$_} } (split('', $dna))));
}

1;
