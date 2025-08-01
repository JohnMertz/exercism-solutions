package SimpleCipher;

use v5.38;
use Exporter qw<import>;
our @EXPORT_OK = qw<new key encode decode>;

sub new($class, %args) {
    my $self = bless { }, $class;
    return $self->key($args{'key'} || undef);
}

sub key($self, $key=undef) {
    return $self->{'key'} if (defined($self->{'key'}) && !defined($key));
    $self->{'key'} = $key || 'aaaaaaaaaa';
    $self->{'key_array'} = [ _zero_offset_array($key || 'a') ];
    return $self;
}

sub encode($self, $plaintext) {
    my $i = 0;
    return join('', map { _sub($_, $self->{'key_array'}->[($i ? $i++ % scalar(@{$self->{'key_array'}}) : $i++)]) } _zero_offset_array(_normalize($plaintext)) );
}

sub decode($self, $cipher) {
    my $i = 0;
    return join('', map { _sub($_, 0-$self->{'key_array'}->[($i ? $i++ % scalar(@{$self->{'key_array'}}) : $i++)]) } _zero_offset_array(_normalize($cipher)) );
}

sub _sub($ord, $offset) {
    return chr( ( ( $ord + $offset ) % 26) + 97);
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
