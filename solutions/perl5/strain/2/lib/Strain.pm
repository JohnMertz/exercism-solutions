package Strain;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<keep discard>;

sub keep($input, $function) {
    return [ grep { defined } ( map { (&{$function}($_) ? $_ : undef) } (@{$input}) ) ];
}

sub discard($input, $function) {
    return [ grep { defined } ( map { (&$function($_) ? undef : $_ ) } (@{$input}) ) ];
}

1;
