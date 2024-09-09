use utf8;
package MyApp::Schema::Result::SyncedSetting;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::SyncedSetting

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<syncedSettings>

=cut

__PACKAGE__->table("syncedSettings");

=head1 ACCESSORS

=head2 setting

  data_type: 'text'
  is_nullable: 0

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: (empty string)
  is_nullable: 0

=head2 version

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 synced

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "setting",
  { data_type => "text", is_nullable => 0 },
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "value",
  { data_type => "", is_nullable => 0 },
  "version",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "synced",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</setting>

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("setting", "libraryid");

=head1 RELATIONS

=head2 libraryid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "libraryid",
  "MyApp::Schema::Result::Library",
  { libraryid => "libraryid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:v59f/tDeIun9nIEQoyp49g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
