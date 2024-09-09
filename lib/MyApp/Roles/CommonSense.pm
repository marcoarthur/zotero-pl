package MyApp::Roles::CommonSense;
use Moose::Role;
use Mojo::Collection qw(c);
use feature qw(signatures);

requires qw(search_rs result_source);

sub not_null($self, $column) {
    return $self->search_rs({ $column => { '!=' => undef } });
}

sub sample($self, $size=10) {
  return $self->search_rs({},{ rows => $size });
}

1;
