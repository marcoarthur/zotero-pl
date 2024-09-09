use utf8;
package MyApp::Schema::Result::ItemTypeFieldsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemTypeFieldsCombined

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

=head1 TABLE: C<itemTypeFieldsCombined>

=cut

__PACKAGE__->table("itemTypeFieldsCombined");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'int'
  is_nullable: 0

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=head2 hide

  data_type: 'int'
  is_nullable: 1

=head2 orderindex

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "int", is_nullable => 0 },
  "fieldid",
  { data_type => "int", is_nullable => 0 },
  "hide",
  { data_type => "int", is_nullable => 1 },
  "orderindex",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=item * L</orderindex>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid", "orderindex");

=head1 UNIQUE CONSTRAINTS

=head2 C<itemtypeid_fieldid_unique>

=over 4

=item * L</itemtypeid>

=item * L</fieldid>

=back

=cut

__PACKAGE__->add_unique_constraint("itemtypeid_fieldid_unique", ["itemtypeid", "fieldid"]);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:24qAf4mYO6w600qZ/WKdmQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
