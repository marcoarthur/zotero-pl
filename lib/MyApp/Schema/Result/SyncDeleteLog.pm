use utf8;
package MyApp::Schema::Result::SyncDeleteLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::SyncDeleteLog

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

=head1 TABLE: C<syncDeleteLog>

=cut

__PACKAGE__->table("syncDeleteLog");

=head1 ACCESSORS

=head2 syncobjecttypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

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
  "syncobjecttypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
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

=head1 UNIQUE CONSTRAINTS

=head2 C<syncobjecttypeid_libraryid_key_unique>

=over 4

=item * L</syncobjecttypeid>

=item * L</libraryid>

=item * L</key>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "syncobjecttypeid_libraryid_key_unique",
  ["syncobjecttypeid", "libraryid", "key"],
);

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

=head2 syncobjecttypeid

Type: belongs_to

Related object: L<MyApp::Schema::Result::SyncObjectType>

=cut

__PACKAGE__->belongs_to(
  "syncobjecttypeid",
  "MyApp::Schema::Result::SyncObjectType",
  { syncobjecttypeid => "syncobjecttypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K+JmrSZWmGO1+HM6CaGigg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
