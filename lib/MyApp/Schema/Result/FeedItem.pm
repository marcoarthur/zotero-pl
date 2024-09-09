use utf8;
package MyApp::Schema::Result::FeedItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FeedItem

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

=head1 TABLE: C<feedItems>

=cut

__PACKAGE__->table("feedItems");

=head1 ACCESSORS

=head2 itemid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 guid

  data_type: 'text'
  is_nullable: 0

=head2 readtime

  data_type: 'timestamp'
  is_nullable: 1

=head2 translatedtime

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "itemid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "guid",
  { data_type => "text", is_nullable => 0 },
  "readtime",
  { data_type => "timestamp", is_nullable => 1 },
  "translatedtime",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</itemid>

=back

=cut

__PACKAGE__->set_primary_key("itemid");

=head1 UNIQUE CONSTRAINTS

=head2 C<guid_unique>

=over 4

=item * L</guid>

=back

=cut

__PACKAGE__->add_unique_constraint("guid_unique", ["guid"]);

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9z10N8QDhxxGkCtkujlfQg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
