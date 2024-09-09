use utf8;
package MyApp::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Tag

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

=head1 TABLE: C<tags>

=cut

__PACKAGE__->table("tags");

=head1 ACCESSORS

=head2 tagid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tagid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</tagid>

=back

=cut

__PACKAGE__->set_primary_key("tagid");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_unique>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name_unique", ["name"]);

=head1 RELATIONS

=head2 item_tags

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTag>

=cut

__PACKAGE__->has_many(
  "item_tags",
  "MyApp::Schema::Result::ItemTag",
  { "foreign.tagid" => "self.tagid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/wrfAT5nFdfc+UQuTqNWEg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
