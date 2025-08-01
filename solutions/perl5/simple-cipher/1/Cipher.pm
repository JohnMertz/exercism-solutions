package Cipher;

use strict;
use warnings;

sub new {
    my ( $class, $key ) = @_;
    die "ArgumentError" if (defined($key) && ($key eq '' || $key =~ m/[^a-z]/));
    return bless { 'key' => $key || 'a', 'key_array' => [ _zero_offset_array($key || 'a') ] }, $class;
}

sub encode {
    my ( $self, $plaintext ) = @_;
    my ( $ret, @input ) = ('', _zero_offset_array(_normalize($plaintext)));
    $ret .= chr( ( ( $input[$_] + $self->{'key_array'}->[$_ % scalar(@{$self->{'key_array'}})] ) % 26) + 97) foreach (0 .. scalar(@input)-1);
    return $ret;
}

sub decode {
    my ( $self, $cipher ) = @_;
    my ($ret, @input) = ('', _zero_offset_array(_normalize($cipher)));
    $ret .= chr( ( ( $input[$_] - $self->{'key_array'}->[$_ % scalar(@{$self->{'key_array'}})] ) % 26) + 97) foreach (0 .. scalar(@input)-1);
    return $ret;
}

sub _zero_offset_array {
    return map { ord($_)-97 } (split('', shift));
}

sub _normalize {
    my $input = lc(shift);
    $input =~ s/[^a-z]//g;
    return $input;
}
1;
