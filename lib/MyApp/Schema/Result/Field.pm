use utf8;
package MyApp::Schema::Result::Field;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Field

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

=head1 TABLE: C<fields>

=cut

__PACKAGE__->table("fields");

=head1 ACCESSORS

=head2 fieldid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 1

=head2 fieldformatid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "fieldid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 1 },
  "fieldformatid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("fieldid");

=head1 RELATIONS

=head2 base_field_mappings_basefieldids

Type: has_many

Related object: L<MyApp::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings_basefieldids",
  "MyApp::Schema::Result::BaseFieldMapping",
  { "foreign.basefieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 base_field_mappings_fieldids

Type: has_many

Related object: L<MyApp::Schema::Result::BaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "base_field_mappings_fieldids",
  "MyApp::Schema::Result::BaseFieldMapping",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 custom_base_field_mappings

Type: has_many

Related object: L<MyApp::Schema::Result::CustomBaseFieldMapping>

=cut

__PACKAGE__->has_many(
  "custom_base_field_mappings",
  "MyApp::Schema::Result::CustomBaseFieldMapping",
  { "foreign.basefieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 custom_item_type_fields

Type: has_many

Related object: L<MyApp::Schema::Result::CustomItemTypeField>

=cut

__PACKAGE__->has_many(
  "custom_item_type_fields",
  "MyApp::Schema::Result::CustomItemTypeField",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fieldformatid

Type: belongs_to

Related object: L<MyApp::Schema::Result::FieldFormat>

=cut

__PACKAGE__->belongs_to(
  "fieldformatid",
  "MyApp::Schema::Result::FieldFormat",
  { fieldformatid => "fieldformatid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 item_type_fields

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTypeField>

=cut

__PACKAGE__->has_many(
  "item_type_fields",
  "MyApp::Schema::Result::ItemTypeField",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OjeKhYfpl5gnT9EKQpBvUQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
