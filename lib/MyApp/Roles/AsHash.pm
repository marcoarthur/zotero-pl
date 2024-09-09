package MyApp::Roles::AsHash;
use Moose::Role;
use feature qw(signatures);

requires qw( get_columns );

sub as_hash ($self){
  return { $self->get_columns };
}

1;
