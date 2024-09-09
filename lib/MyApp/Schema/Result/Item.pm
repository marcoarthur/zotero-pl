use utf8;
package MyApp::Schema::Result::Item;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Item

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

=head1 TABLE: C<items>

=cut

__PACKAGE__->table("items");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 itemtypeid

  data_type: 'int'
  is_nullable: 0

=head2 dateadded

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 datemodified

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

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
  "itemid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "itemtypeid",
  { data_type => "int", is_nullable => 0 },
  "dateadded",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "datemodified",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
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

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

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
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 deleted_item

Type: might_have

Related object: L<MyApp::Schema::Result::DeletedItem>

=cut

__PACKAGE__->might_have(
  "deleted_item",
  "MyApp::Schema::Result::DeletedItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feed_item

Type: might_have

Related object: L<MyApp::Schema::Result::FeedItem>

=cut

__PACKAGE__->might_have(
  "feed_item",
  "MyApp::Schema::Result::FeedItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fulltext_item

Type: might_have

Related object: L<MyApp::Schema::Result::FulltextItem>

=cut

__PACKAGE__->might_have(
  "fulltext_item",
  "MyApp::Schema::Result::FulltextItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fulltext_item_words

Type: has_many

Related object: L<MyApp::Schema::Result::FulltextItemWord>

=cut

__PACKAGE__->has_many(
  "fulltext_item_words",
  "MyApp::Schema::Result::FulltextItemWord",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group_item

Type: might_have

Related object: L<MyApp::Schema::Result::GroupItem>

=cut

__PACKAGE__->might_have(
  "group_item",
  "MyApp::Schema::Result::GroupItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_annotation

Type: might_have

Related object: L<MyApp::Schema::Result::ItemAnnotation>

=cut

__PACKAGE__->might_have(
  "item_annotation",
  "MyApp::Schema::Result::ItemAnnotation",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_attachments_itemid

Type: might_have

Related object: L<MyApp::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->might_have(
  "item_attachments_itemid",
  "MyApp::Schema::Result::ItemAttachment",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_attachments_parentitemids

Type: has_many

Related object: L<MyApp::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->has_many(
  "item_attachments_parentitemids",
  "MyApp::Schema::Result::ItemAttachment",
  { "foreign.parentitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_creators

Type: has_many

Related object: L<MyApp::Schema::Result::ItemCreator>

=cut

__PACKAGE__->has_many(
  "item_creators",
  "MyApp::Schema::Result::ItemCreator",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_datas

Type: has_many

Related object: L<MyApp::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "MyApp::Schema::Result::ItemData",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_notes_itemid

Type: might_have

Related object: L<MyApp::Schema::Result::ItemNote>

=cut

__PACKAGE__->might_have(
  "item_notes_itemid",
  "MyApp::Schema::Result::ItemNote",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_notes_parentitemids

Type: has_many

Related object: L<MyApp::Schema::Result::ItemNote>

=cut

__PACKAGE__->has_many(
  "item_notes_parentitemids",
  "MyApp::Schema::Result::ItemNote",
  { "foreign.parentitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_relations

Type: has_many

Related object: L<MyApp::Schema::Result::ItemRelation>

=cut

__PACKAGE__->has_many(
  "item_relations",
  "MyApp::Schema::Result::ItemRelation",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_tags

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTag>

=cut

__PACKAGE__->has_many(
  "item_tags",
  "MyApp::Schema::Result::ItemTag",
  { "foreign.itemid" => "self.itemid" },
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

=head2 retracted_item

Type: might_have

Related object: L<MyApp::Schema::Result::RetractedItem>

=cut

__PACKAGE__->might_have(
  "retracted_item",
  "MyApp::Schema::Result::RetractedItem",
  { "foreign.itemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 wordids

Type: many_to_many

Composing rels: L</fulltext_item_words> -> wordid

=cut

__PACKAGE__->many_to_many("wordids", "fulltext_item_words", "wordid");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zm27ZgBU8HL8vUaLW7WgIw

__PACKAGE__->belongs_to(
  "type",
  "MyApp::Schema::Result::ItemType",
  { 'foreign.itemtypeid' => "self.itemtypeid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

with qw/ MyApp::Roles::AsHash MyApp::Roles::ExtraColumn/;
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
