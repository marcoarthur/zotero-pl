use utf8;
package MyApp::Schema::Result::ItemData;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemData

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

=head1 TABLE: C<itemData>

=cut

__PACKAGE__->table("itemData");

=head1 ACCESSORS

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 fieldid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 valueid

  data_type: (empty string)
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "fieldid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "valueid",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("itemid", "fieldid");

=head1 RELATIONS

=head2 fieldid

Type: belongs_to

Related object: L<MyApp::Schema::Result::FieldsCombined>

=cut

__PACKAGE__->belongs_to(
  "fieldid",
  "MyApp::Schema::Result::FieldsCombined",
  { fieldid => "fieldid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
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

=head2 valueid

Type: belongs_to

Related object: L<MyApp::Schema::Result::ItemDataValue>

=cut

__PACKAGE__->belongs_to(
  "valueid",
  "MyApp::Schema::Result::ItemDataValue",
  { valueid => "valueid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MQ1BCyxvTPoliZODKE0yQA


with qw/ MyApp::Roles::AsHash /;
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
