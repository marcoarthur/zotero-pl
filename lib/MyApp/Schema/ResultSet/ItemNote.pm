package MyApp::Schema::ResultSet::ItemNote;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

with qw/
MyApp::Roles::Prefetch MyApp::Roles::CommonSense MyApp::Roles::FullTextSearch
/;

1;
