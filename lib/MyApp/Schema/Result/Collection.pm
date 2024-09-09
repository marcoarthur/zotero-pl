use utf8;
package MyApp::Schema::Result::Collection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Collection

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

=head1 TABLE: C<collections>

=cut

__PACKAGE__->table("collections");

=head1 ACCESSORS

=head2 collectionid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 collectionname

  data_type: 'text'
  is_nullable: 0

=head2 parentcollectionid

  data_type: 'int'
  default_value: null
  is_foreign_key: 1
  is_nullable: 1

=head2 clientdatemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 key

  data_type: 'text'
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
  "collectionid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "collectionname",
  { data_type => "text", is_nullable => 0 },
  "parentcollectionid",
  {
    data_type      => "int",
    default_value  => \"null",
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "clientdatemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "int", default_value => 0, is_nullable => 0 },
  "synced",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</collectionid>

=back

=cut

__PACKAGE__->set_primary_key("collectionid");

=head1 UNIQUE CONSTRAINTS

=head2 C<libraryid_key_unique>

=over 4

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);

=head1 RELATIONS

=head2 collection_items

Type: has_many

Related object: L<MyApp::Schema::Result::CollectionItem>

=cut

__PACKAGE__->has_many(
  "collection_items",
  "MyApp::Schema::Result::CollectionItem",
  { "foreign.collectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 collection_relations

Type: has_many

Related object: L<MyApp::Schema::Result::CollectionRelation>

=cut

__PACKAGE__->has_many(
  "collection_relations",
  "MyApp::Schema::Result::CollectionRelation",
  { "foreign.collectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 collections

Type: has_many

Related object: L<MyApp::Schema::Result::Collection>

=cut

__PACKAGE__->has_many(
  "collections",
  "MyApp::Schema::Result::Collection",
  { "foreign.parentcollectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 deleted_collection

Type: might_have

Related object: L<MyApp::Schema::Result::DeletedCollection>

=cut

__PACKAGE__->might_have(
  "deleted_collection",
  "MyApp::Schema::Result::DeletedCollection",
  { "foreign.collectionid" => "self.collectionid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 parentcollectionid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Collection>

=cut

__PACKAGE__->belongs_to(
  "parentcollectionid",
  "MyApp::Schema::Result::Collection",
  { collectionid => "parentcollectionid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CEfRSwjDO8VRrmGcaIWcwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
