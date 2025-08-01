package KindergartenGarden;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

# Less generic implementation which requires the students to be named alphabetically.
sub plants($diagram, $student) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    return [ map { $plants{ substr($_,((ord(lc(substr($student,0,1))))-97)*2, 1) }, $plants{ substr($_,((ord(lc(substr($student,0,1))))-97)*2+1, 1) } } split('\n', $diagram) ];
}

1;
