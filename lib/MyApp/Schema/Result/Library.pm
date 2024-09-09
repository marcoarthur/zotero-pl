use utf8;
package MyApp::Schema::Result::Library;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Library

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

=head1 TABLE: C<libraries>

=cut

__PACKAGE__->table("libraries");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'text'
  is_nullable: 0

=head2 editable

  data_type: 'int'
  is_nullable: 0

=head2 fileseditable

  data_type: 'int'
  is_nullable: 0

=head2 version

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 storageversion

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 lastsync

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=head2 archived

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "type",
  { data_type => "text", is_nullable => 0 },
  "editable",
  { data_type => "int", is_nullable => 0 },
  "fileseditable",
  { data_type => "int", is_nullable => 0 },
  "version",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "storageversion",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "lastsync",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "archived",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid");

=head1 RELATIONS

=head2 collections

Type: has_many

Related object: L<MyApp::Schema::Result::Collection>

=cut

__PACKAGE__->has_many(
  "collections",
  "MyApp::Schema::Result::Collection",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feed

Type: might_have

Related object: L<MyApp::Schema::Result::Feed>

=cut

__PACKAGE__->might_have(
  "feed",
  "MyApp::Schema::Result::Feed",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group

Type: might_have

Related object: L<MyApp::Schema::Result::Group>

=cut

__PACKAGE__->might_have(
  "group",
  "MyApp::Schema::Result::Group",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items

Type: has_many

Related object: L<MyApp::Schema::Result::Item>

=cut

__PACKAGE__->has_many(
  "items",
  "MyApp::Schema::Result::Item",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 saved_searches

Type: has_many

Related object: L<MyApp::Schema::Result::SavedSearch>

=cut

__PACKAGE__->has_many(
  "saved_searches",
  "MyApp::Schema::Result::SavedSearch",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 storage_delete_logs

Type: has_many

Related object: L<MyApp::Schema::Result::StorageDeleteLog>

=cut

__PACKAGE__->has_many(
  "storage_delete_logs",
  "MyApp::Schema::Result::StorageDeleteLog",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_caches

Type: has_many

Related object: L<MyApp::Schema::Result::SyncCache>

=cut

__PACKAGE__->has_many(
  "sync_caches",
  "MyApp::Schema::Result::SyncCache",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_delete_logs

Type: has_many

Related object: L<MyApp::Schema::Result::SyncDeleteLog>

=cut

__PACKAGE__->has_many(
  "sync_delete_logs",
  "MyApp::Schema::Result::SyncDeleteLog",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_queues

Type: has_many

Related object: L<MyApp::Schema::Result::SyncQueue>

=cut

__PACKAGE__->has_many(
  "sync_queues",
  "MyApp::Schema::Result::SyncQueue",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 synced_settings

Type: has_many

Related object: L<MyApp::Schema::Result::SyncedSetting>

=cut

__PACKAGE__->has_many(
  "synced_settings",
  "MyApp::Schema::Result::SyncedSetting",
  { "foreign.libraryid" => "self.libraryid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xFhA3HVD2kwl2ZCG55/0LA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
