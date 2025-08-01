package Strain;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<keep discard>;

sub keep {
    my ( $input, $function ) = @_;
    return [ grep { defined } ( map { (&{$function}($_) ? $_ : undef) } (@{$input}) ) ];
}

sub discard {
    my ( $input, $function ) = @_;
    return [ grep { defined } ( map { (&$function($_) ? undef : $_ ) } (@{$input}) ) ];
}

1;
