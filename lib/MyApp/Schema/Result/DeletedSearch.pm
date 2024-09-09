use utf8;
package MyApp::Schema::Result::DeletedSearch;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::DeletedSearch

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

=head1 TABLE: C<deletedSearches>

=cut

__PACKAGE__->table("deletedSearches");

=head1 ACCESSORS

=head2 savedsearchid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 datedeleted

  data_type: (empty string)
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "savedsearchid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "datedeleted",
  {
    data_type     => "",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</savedsearchid>

=back

=cut

__PACKAGE__->set_primary_key("savedsearchid");

=head1 RELATIONS

=head2 savedsearchid

Type: belongs_to

Related object: L<MyApp::Schema::Result::SavedSearch>

=cut

__PACKAGE__->belongs_to(
  "savedsearchid",
  "MyApp::Schema::Result::SavedSearch",
  { savedsearchid => "savedsearchid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cUuWtTc3D4YirB2CEC7Usg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
