package KindergartenGarden;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants {
    my ( $diagram, $student ) = @_;
    my %students = ( 
        'Alice'     => 0,
        'Bob'       => 1,
        'Charlie'   => 2,
        'David'     => 3,
        'Eve'       => 4,
        'Fred'      => 5,
        'Ginny'     => 6,
        'Harriet'   => 7,
        'Ileana'    => 8,
        'Joseph'    => 9,
        'Kincaid'   => 10,
        'Larry'     => 11
    );
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    my @ret;
    foreach (split('\n', $diagram)) {
        push(
            @ret,
            $plants{ substr($_,$students{$student}*2, 1) },
            $plants{ substr($_,$students{$student}*2+1, 1) }
        );
    }
    return \@ret;
}

1;
