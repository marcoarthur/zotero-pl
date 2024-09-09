use utf8;
package MyApp::Schema::Result::ItemAttachment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemAttachment

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

=head1 TABLE: C<itemAttachments>

=cut

__PACKAGE__->table("itemAttachments");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 parentitemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 linkmode

  data_type: 'int'
  is_nullable: 1

=head2 contenttype

  data_type: 'text'
  is_nullable: 1

=head2 charsetid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 syncstate

  data_type: 'int'
  default_value: 0
  is_nullable: 1

=head2 storagemodtime

  data_type: 'int'
  is_nullable: 1

=head2 storagehash

  data_type: 'text'
  is_nullable: 1

=head2 lastprocessedmodificationtime

  data_type: 'int'
  is_nullable: 1

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
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "linkmode",
  { data_type => "int", is_nullable => 1 },
  "contenttype",
  { data_type => "text", is_nullable => 1 },
  "charsetid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "syncstate",
  { data_type => "int", default_value => 0, is_nullable => 1 },
  "storagemodtime",
  { data_type => "int", is_nullable => 1 },
  "storagehash",
  { data_type => "text", is_nullable => 1 },
  "lastprocessedmodificationtime",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 RELATIONS

=head2 charsetid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Charset>

=cut

__PACKAGE__->belongs_to(
  "charsetid",
  "MyApp::Schema::Result::Charset",
  { charsetid => "charsetid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

=head2 item_annotations

Type: has_many

Related object: L<MyApp::Schema::Result::ItemAnnotation>

=cut

__PACKAGE__->has_many(
  "item_annotations",
  "MyApp::Schema::Result::ItemAnnotation",
  { "foreign.parentitemid" => "self.itemid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

Related object: L<MyApp::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "parentitemid",
  "MyApp::Schema::Result::Item",
  { itemid => "parentitemid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4mfUp9XYp62Pc+ni+shxdQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
