use utf8;
package MyApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 userid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "userid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</userid>

=back

=cut

__PACKAGE__->set_primary_key("userid");

=head1 RELATIONS

=head2 group_items_createdbyuserids

Type: has_many

Related object: L<MyApp::Schema::Result::GroupItem>

=cut

__PACKAGE__->has_many(
  "group_items_createdbyuserids",
  "MyApp::Schema::Result::GroupItem",
  { "foreign.createdbyuserid" => "self.userid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group_items_lastmodifiedbyuserids

Type: has_many

Related object: L<MyApp::Schema::Result::GroupItem>

=cut

__PACKAGE__->has_many(
  "group_items_lastmodifiedbyuserids",
  "MyApp::Schema::Result::GroupItem",
  { "foreign.lastmodifiedbyuserid" => "self.userid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GFioPH6a67RlRYikdNLpwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
