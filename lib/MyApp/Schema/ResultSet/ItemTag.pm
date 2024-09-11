package MyApp::Schema::ResultSet::ItemTag;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';
with qw/ MyApp::Roles::Prefetch MyApp::Roles::CommonSense /;
1;
