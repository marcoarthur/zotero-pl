package MyApp::Schema::ResultSet::ItemType;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

sub names($self) {
  $self->search_rs(
    undef, 
    { 
      select => [qw/typename itemtypeid/],
      distinct => 1,
    }
  );
}

with qw/MyApp::Roles::Prefetch MyApp::Roles::CommonSense/;

1;
