use utf8;
package MyApp::Schema::Result::FulltextItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FulltextItem

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

=head1 TABLE: C<fulltextItems>

=cut

__PACKAGE__->table("fulltextItems");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 indexedpages

  data_type: 'int'
  is_nullable: 1

=head2 totalpages

  data_type: 'int'
  is_nullable: 1

=head2 indexedchars

  data_type: 'int'
  is_nullable: 1

=head2 totalchars

  data_type: 'int'
  is_nullable: 1

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
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "indexedpages",
  { data_type => "int", is_nullable => 1 },
  "totalpages",
  { data_type => "int", is_nullable => 1 },
  "indexedchars",
  { data_type => "int", is_nullable => 1 },
  "totalchars",
  { data_type => "int", is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3Gf0hmtkyfFFwiuTQdH5Gw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
