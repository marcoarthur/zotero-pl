use utf8;
package MyApp::Schema::Result::ItemAnnotation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemAnnotation

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

=head1 TABLE: C<itemAnnotations>

=cut

__PACKAGE__->table("itemAnnotations");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 parentitemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 type

  data_type: 'integer'
  is_nullable: 0

=head2 authorname

  data_type: 'text'
  is_nullable: 1

=head2 text

  data_type: 'text'
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 color

  data_type: 'text'
  is_nullable: 1

=head2 pagelabel

  data_type: 'text'
  is_nullable: 1

=head2 sortindex

  data_type: 'text'
  is_nullable: 0

=head2 position

  data_type: 'text'
  is_nullable: 0

=head2 isexternal

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "parentitemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "type",
  { data_type => "integer", is_nullable => 0 },
  "authorname",
  { data_type => "text", is_nullable => 1 },
  "text",
  { data_type => "text", is_nullable => 1 },
  "comment",
  { data_type => "text", is_nullable => 1 },
  "color",
  { data_type => "text", is_nullable => 1 },
  "pagelabel",
  { data_type => "text", is_nullable => 1 },
  "sortindex",
  { data_type => "text", is_nullable => 0 },
  "position",
  { data_type => "text", is_nullable => 0 },
  "isexternal",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 RELATIONS

=head2 itemid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "itemid",
  "MyApp::Schema::Result::Item",
  { itemid => "itemid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 parentitemid

Type: belongs_to

Related object: L<MyApp::Schema::Result::ItemAttachment>

=cut

__PACKAGE__->belongs_to(
  "parentitemid",
  "MyApp::Schema::Result::ItemAttachment",
  { itemid => "parentitemid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yExHlDTFCqk++b/je1DksQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
