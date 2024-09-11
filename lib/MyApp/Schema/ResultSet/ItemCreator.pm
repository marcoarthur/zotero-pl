package MyApp::Schema::ResultSet::ItemCreator;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';
with qw/ MyApp::Roles::Prefetch MyApp::Roles::CommonSense /;
1;
