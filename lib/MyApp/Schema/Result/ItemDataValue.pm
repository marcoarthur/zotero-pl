use utf8;
package MyApp::Schema::Result::ItemDataValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::ItemDataValue

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

=head1 TABLE: C<itemDataValues>

=cut

__PACKAGE__->table("itemDataValues");

=head1 ACCESSORS

=head2 valueid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 value

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "valueid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "value",
  { data_type => "", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</valueid>

=back

=cut

__PACKAGE__->set_primary_key("valueid");

=head1 UNIQUE CONSTRAINTS

=head2 C<value_unique>

=over 4

=item * L</value>

=back

=cut

__PACKAGE__->add_unique_constraint("value_unique", ["value"]);

=head1 RELATIONS

=head2 item_datas

Type: has_many

Related object: L<MyApp::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "MyApp::Schema::Result::ItemData",
  { "foreign.valueid" => "self.valueid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RKrgwoVVQZXkrCjAEJbl4Q


with qw/ MyApp::Roles::AsHash /;
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
