use utf8;
package MyApp::Schema::Result::Version;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Version

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

=head1 TABLE: C<version>

=cut

__PACKAGE__->table("version");

=head1 ACCESSORS

=head2 schema

  data_type: 'text'
  is_nullable: 0

=head2 version

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "schema",
  { data_type => "text", is_nullable => 0 },
  "version",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</schema>

=back

=cut

__PACKAGE__->set_primary_key("schema");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8VCFSDQtXm0Lfdrxc02W7A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
