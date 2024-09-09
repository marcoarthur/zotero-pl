use utf8;
package MyApp::Schema::Result::ItemTypeCreatorType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemTypeCreatorType

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

=head1 TABLE: C<itemTypeCreatorTypes>

=cut

__PACKAGE__->table("itemTypeCreatorTypes");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatortypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 primaryfield

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatortypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "primaryfield",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=item * L</creatortypeid>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid", "creatortypeid");

=head1 RELATIONS

=head2 creatortypeid

Type: belongs_to

Related object: L<MyApp::Schema::Result::CreatorType>

=cut

__PACKAGE__->belongs_to(
  "creatortypeid",
  "MyApp::Schema::Result::CreatorType",
  { creatortypeid => "creatortypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 itemtypeid

Type: belongs_to

Related object: L<MyApp::Schema::Result::ItemType>

=cut

__PACKAGE__->belongs_to(
  "itemtypeid",
  "MyApp::Schema::Result::ItemType",
  { itemtypeid => "itemtypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JAl92YwdnrAi4iYeHp6KvQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
