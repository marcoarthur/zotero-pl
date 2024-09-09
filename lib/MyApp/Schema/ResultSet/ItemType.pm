package MyApp::Schema::ResultSet::ItemType;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

with 'MyApp::Roles::Prefetch';

1;
