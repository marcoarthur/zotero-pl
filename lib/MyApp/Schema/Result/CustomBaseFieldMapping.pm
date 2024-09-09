use utf8;
package MyApp::Schema::Result::CustomBaseFieldMapping;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::CustomBaseFieldMapping

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

=head1 TABLE: C<customBaseFieldMappings>

=cut

__PACKAGE__->table("customBaseFieldMappings");

=head1 ACCESSORS

=head2 customitemtypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 basefieldid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 customfieldid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "customitemtypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "basefieldid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "customfieldid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customitemtypeid>

=item * L</basefieldid>

=item * L</customfieldid>

=back

=cut

__PACKAGE__->set_primary_key("customitemtypeid", "basefieldid", "customfieldid");

=head1 RELATIONS

=head2 basefieldid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Field>

=cut

__PACKAGE__->belongs_to(
  "basefieldid",
  "MyApp::Schema::Result::Field",
  { fieldid => "basefieldid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 customfieldid

Type: belongs_to

Related object: L<MyApp::Schema::Result::CustomField>

=cut

__PACKAGE__->belongs_to(
  "customfieldid",
  "MyApp::Schema::Result::CustomField",
  { customfieldid => "customfieldid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 customitemtypeid

Type: belongs_to

Related object: L<MyApp::Schema::Result::CustomItemType>

=cut

__PACKAGE__->belongs_to(
  "customitemtypeid",
  "MyApp::Schema::Result::CustomItemType",
  { customitemtypeid => "customitemtypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OJ/VcNSmzfBxbpMQHdlseg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
