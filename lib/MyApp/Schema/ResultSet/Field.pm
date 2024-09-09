package MyApp::Schema::ResultSet::Field;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

with 'MyApp::Roles::Prefetch';

1;
