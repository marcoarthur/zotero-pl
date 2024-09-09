use utf8;
package MyApp::Schema::Result::FieldFormat;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FieldFormat

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

=head1 TABLE: C<fieldFormats>

=cut

__PACKAGE__->table("fieldFormats");

=head1 ACCESSORS

=head2 fieldformatid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 regex

  data_type: 'text'
  is_nullable: 1

=head2 isinteger

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "fieldformatid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "regex",
  { data_type => "text", is_nullable => 1 },
  "isinteger",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldformatid>

=back

=cut

__PACKAGE__->set_primary_key("fieldformatid");

=head1 RELATIONS

=head2 fields

Type: has_many

Related object: L<MyApp::Schema::Result::Field>

=cut

__PACKAGE__->has_many(
  "fields",
  "MyApp::Schema::Result::Field",
  { "foreign.fieldformatid" => "self.fieldformatid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xCn0GaFpsigPDkaKkl4H8w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
