use utf8;
package MyApp::Schema::Result::RelationPredicate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::RelationPredicate

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

=head1 TABLE: C<relationPredicates>

=cut

__PACKAGE__->table("relationPredicates");

=head1 ACCESSORS

=head2 predicateid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 predicate

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "predicateid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "predicate",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</predicateid>

=back

=cut

__PACKAGE__->set_primary_key("predicateid");

=head1 UNIQUE CONSTRAINTS

=head2 C<predicate_unique>

=over 4

=item * L</predicate>

=back

=cut

__PACKAGE__->add_unique_constraint("predicate_unique", ["predicate"]);

=head1 RELATIONS

=head2 collection_relations

Type: has_many

Related object: L<MyApp::Schema::Result::CollectionRelation>

=cut

__PACKAGE__->has_many(
  "collection_relations",
  "MyApp::Schema::Result::CollectionRelation",
  { "foreign.predicateid" => "self.predicateid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item_relations

Type: has_many

Related object: L<MyApp::Schema::Result::ItemRelation>

=cut

__PACKAGE__->has_many(
  "item_relations",
  "MyApp::Schema::Result::ItemRelation",
  { "foreign.predicateid" => "self.predicateid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ibOTZB7zG2o6GhCRfW/JRg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
