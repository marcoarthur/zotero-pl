use utf8;
package MyApp::Schema::Result::StorageDeleteLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::StorageDeleteLog

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

=head1 TABLE: C<storageDeleteLog>

=cut

__PACKAGE__->table("storageDeleteLog");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 key

  data_type: 'text'
  is_nullable: 0

=head2 datedeleted

  data_type: 'text'
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "datedeleted",
  {
    data_type     => "text",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->set_primary_key("libraryid", "key");

=head1 RELATIONS

=head2 libraryid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "libraryid",
  "MyApp::Schema::Result::Library",
  { libraryid => "libraryid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Z1Y02qjgo4LrVsQymFgGuw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
