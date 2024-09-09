use utf8;
package MyApp::Schema::Result::SyncObjectType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::SyncObjectType

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

=head1 TABLE: C<syncObjectTypes>

=cut

__PACKAGE__->table("syncObjectTypes");

=head1 ACCESSORS

=head2 syncobjecttypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "syncobjecttypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</syncobjecttypeid>

=back

=cut

__PACKAGE__->set_primary_key("syncobjecttypeid");

=head1 RELATIONS

=head2 sync_caches

Type: has_many

Related object: L<MyApp::Schema::Result::SyncCache>

=cut

__PACKAGE__->has_many(
  "sync_caches",
  "MyApp::Schema::Result::SyncCache",
  { "foreign.syncobjecttypeid" => "self.syncobjecttypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_delete_logs

Type: has_many

Related object: L<MyApp::Schema::Result::SyncDeleteLog>

=cut

__PACKAGE__->has_many(
  "sync_delete_logs",
  "MyApp::Schema::Result::SyncDeleteLog",
  { "foreign.syncobjecttypeid" => "self.syncobjecttypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sync_queues

Type: has_many

Related object: L<MyApp::Schema::Result::SyncQueue>

=cut

__PACKAGE__->has_many(
  "sync_queues",
  "MyApp::Schema::Result::SyncQueue",
  { "foreign.syncobjecttypeid" => "self.syncobjecttypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OtnENGmbZ5lpp0I1wssXWw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
