use utf8;
package MyApp::Schema::Result::ItemCreator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemCreator

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

=head1 TABLE: C<itemCreators>

=cut

__PACKAGE__->table("itemCreators");

=head1 ACCESSORS

=head2 itemid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatorid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 creatortypeid

  data_type: 'int'
  default_value: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 orderindex

  data_type: 'int'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatorid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "creatortypeid",
  {
    data_type      => "int",
    default_value  => 1,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "orderindex",
  { data_type => "int", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=item * L</creatorid>

=item * L</creatortypeid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->set_primary_key("itemid", "creatorid", "creatortypeid", "orderindex");

=head1 UNIQUE CONSTRAINTS

=head2 C<itemid_orderindex_unique>

=over 4

=item * L</itemid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->add_unique_constraint("itemid_orderindex_unique", ["itemid", "orderindex"]);

=head1 RELATIONS

=head2 creatorid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Creator>

=cut

__PACKAGE__->belongs_to(
  "creatorid",
  "MyApp::Schema::Result::Creator",
  { creatorid => "creatorid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);

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


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Vs7iEARE31SNkDjGF8nriQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
