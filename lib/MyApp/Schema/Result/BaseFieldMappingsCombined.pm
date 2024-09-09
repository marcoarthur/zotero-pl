use utf8;
package MyApp::Schema::Result::BaseFieldMappingsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::BaseFieldMappingsCombined

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

=head1 TABLE: C<baseFieldMappingsCombined>

=cut

__PACKAGE__->table("baseFieldMappingsCombined");

=head1 ACCESSORS

=head2 itemtypeid

  data_type: 'int'
  is_nullable: 0

=head2 basefieldid

  data_type: 'int'
  is_nullable: 0

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "int", is_nullable => 0 },
  "basefieldid",
  { data_type => "int", is_nullable => 0 },
  "fieldid",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemtypeid>

=item * L</basefieldid>

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("itemtypeid", "basefieldid", "fieldid");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mVZTOmYlHs1BgPQ8fVQEWw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
