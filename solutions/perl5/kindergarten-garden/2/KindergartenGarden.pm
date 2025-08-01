package KindergartenGarden;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

# Less generic implementation which requires the students to be named alphabetically.
sub plants {
    my ( $diagram, $student ) = @_;
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    my @ret;
    foreach (split('\n', $diagram)) {
        push(@ret, $plants{ substr($_,((ord(lc(substr($student,0,1))))-97)*2, 1) }, $plants{ substr($_,((ord(lc(substr($student,0,1))))-97)*2+1, 1) } );
    }
    return \@ret;
}

1;
