use utf8;
package MyApp::Schema::Result::FulltextWord;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FulltextWord

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

=head1 TABLE: C<fulltextWords>

=cut

__PACKAGE__->table("fulltextWords");

=head1 ACCESSORS

=head2 wordid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 word

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "wordid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "word",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</wordid>

=back

=cut

__PACKAGE__->set_primary_key("wordid");

=head1 UNIQUE CONSTRAINTS

=head2 C<word_unique>

=over 4

=item * L</word>

=back

=cut

__PACKAGE__->add_unique_constraint("word_unique", ["word"]);

=head1 RELATIONS

=head2 fulltext_item_words

Type: has_many

Related object: L<MyApp::Schema::Result::FulltextItemWord>

=cut

__PACKAGE__->has_many(
  "fulltext_item_words",
  "MyApp::Schema::Result::FulltextItemWord",
  { "foreign.wordid" => "self.wordid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 itemids

Type: many_to_many

Composing rels: L</fulltext_item_words> -> itemid

=cut

__PACKAGE__->many_to_many("itemids", "fulltext_item_words", "itemid");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:arv84u0hh3Fbf1oxwXo+OQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
with qw/ MyApp::Roles::AsHash /;

__PACKAGE__->meta->make_immutable;
1;
