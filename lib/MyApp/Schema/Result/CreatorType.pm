use utf8;
package MyApp::Schema::Result::CreatorType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::CreatorType

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

=head1 TABLE: C<creatorTypes>

=cut

__PACKAGE__->table("creatorTypes");

=head1 ACCESSORS

=head2 creatortypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 creatortype

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "creatortypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "creatortype",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</creatortypeid>

=back

=cut

__PACKAGE__->set_primary_key("creatortypeid");

=head1 RELATIONS

=head2 item_creators

Type: has_many

Related object: L<MyApp::Schema::Result::ItemCreator>

=cut

__PACKAGE__->has_many(
  "item_creators",
  "MyApp::Schema::Result::ItemCreator",
  { "foreign.creatortypeid" => "self.creatortypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_type_creator_types

Type: has_many

Related object: L<MyApp::Schema::Result::ItemTypeCreatorType>

=cut

__PACKAGE__->has_many(
  "item_type_creator_types",
  "MyApp::Schema::Result::ItemTypeCreatorType",
  { "foreign.creatortypeid" => "self.creatortypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ljzp29E7KfC3k+TZAi0wUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
