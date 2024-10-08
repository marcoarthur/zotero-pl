use utf8;
package MyApp::Schema::Result::FileType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FileType

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

=head1 TABLE: C<fileTypes>

=cut

__PACKAGE__->table("fileTypes");

=head1 ACCESSORS

=head2 filetypeid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 filetype

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "filetypeid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "filetype",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</filetypeid>

=back

=cut

__PACKAGE__->set_primary_key("filetypeid");

=head1 UNIQUE CONSTRAINTS

=head2 C<filetype_unique>

=over 4

=item * L</filetype>

=back

=cut

__PACKAGE__->add_unique_constraint("filetype_unique", ["filetype"]);

=head1 RELATIONS

=head2 file_type_mime_types

Type: has_many

Related object: L<MyApp::Schema::Result::FileTypeMimeType>

=cut

__PACKAGE__->has_many(
  "file_type_mime_types",
  "MyApp::Schema::Result::FileTypeMimeType",
  { "foreign.filetypeid" => "self.filetypeid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8wzOc7eZTOLjrHBNSw03lw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
