package MyApp::Roles::ExtraColumn;
use Moose::Role;
use Carp qw(croak);
use feature qw(signatures);

requires qw(get_columns);

sub AUTOLOAD ($self, @args){
  my ($method) = our $AUTOLOAD =~ /::(\w+)$/;
  my %data = $self->get_columns;
  return $data{$method} if exists $data{$method};
  croak sprintf "No column named %s in %s", $method, ref $self;
}

1;
