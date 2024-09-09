use utf8;
package MyApp::Schema::Result::Creator;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Creator

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

=head1 TABLE: C<creators>

=cut

__PACKAGE__->table("creators");

=head1 ACCESSORS

=head2 creatorid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'text'
  is_nullable: 1

=head2 lastname

  data_type: 'text'
  is_nullable: 1

=head2 fieldmode

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "creatorid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "text", is_nullable => 1 },
  "lastname",
  { data_type => "text", is_nullable => 1 },
  "fieldmode",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</creatorid>

=back

=cut

__PACKAGE__->set_primary_key("creatorid");

=head1 UNIQUE CONSTRAINTS

=head2 C<lastname_firstname_fieldmode_unique>

=over 4

=item * L</lastname>

=item * L</firstname>

=item * L</fieldmode>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "lastname_firstname_fieldmode_unique",
  ["lastname", "firstname", "fieldmode"],
);

=head1 RELATIONS

=head2 item_creators

Type: has_many

Related object: L<MyApp::Schema::Result::ItemCreator>

=cut

__PACKAGE__->has_many(
  "item_creators",
  "MyApp::Schema::Result::ItemCreator",
  { "foreign.creatorid" => "self.creatorid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lvQ2RdokZUtcm32TNkHDqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->has_many(
  "items_inner",
  "MyApp::Schema::Result::ItemCreator",
  { "foreign.creatorid" => "self.creatorid" },
  { cascade_delete => 0, cascade_delete => 0, join_type => 'INNER' },
);

with( qw/ MyApp::Roles::AsHash / );

__PACKAGE__->meta->make_immutable;
1;
