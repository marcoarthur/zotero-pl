use utf8;
package MyApp::Schema::Result::ItemType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemType

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

=head1 TABLE: C<itemTypes>

=cut

__PACKAGE__->table("itemTypes");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 typename

  data_type: 'text'
  is_nullable: 1

=head2 templateitemtypeid

  data_type: 'int'
  is_nullable: 1

=head2 display

  data_type: 'int'
  default_value: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "typename",
  { data_type => "text", is_nullable => 1 },
  "templateitemtypeid",
  { data_type => "int", is_nullable => 1 },
  "display",
  { data_type => "int", default_value => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid");

=head1 RELATIONS

=head2 base_field_mappings

Type: has_many

Related object: L<MyApp::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings",
  "MyApp::Schema::Result::BaseFieldMapping",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_type_creator_types

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTypeCreatorType>

=cut

__PACKAGE__->has_many(
  "item_type_creator_types",
  "MyApp::Schema::Result::ItemTypeCreatorType",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_type_fields

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTypeField>

=cut

__PACKAGE__->has_many(
  "item_type_fields",
  "MyApp::Schema::Result::ItemTypeField",
  { "foreign.itemtypeid" => "self.itemtypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X+7AUUi5Ve+n1WzhY3sJ3w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
