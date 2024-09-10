package MyApp::Roles::CommonSense;
use Moose::Role;
use Mojo::Collection qw(c);
use feature qw(signatures);
use DBIx::Class::ResultClass::HashRefInflator;
use DDP;

requires qw(search_rs result_source);

sub not_null($self, $column) {
    return $self->search_rs({ $column => { '!=' => undef } });
}

sub sample($self, $size=10) {
  return $self->search_rs({},{ rows => $size });
}

sub show_raw($self, $limit=10) {
  p $_ for $self->search_rs(
    undef, 
    { result_class => 'DBIx::Class::ResultClass::HashRefInflator' }
  )->sample($limit)->all;
}

1;
