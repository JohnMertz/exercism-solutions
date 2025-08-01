package NucleotideCount;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides($strand) {
    my %gattaca = ( 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 );
    foreach (split('', $strand)) {
        die "Invalid nucleotide in strand" unless (defined($gattaca{$_}));
        $gattaca{$_}++; 
    }
    return \%gattaca;
}

1;
