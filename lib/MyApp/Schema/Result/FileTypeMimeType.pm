use utf8;
package MyApp::Schema::Result::FileTypeMimeType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FileTypeMimeType

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

=head1 TABLE: C<fileTypeMimeTypes>

=cut

__PACKAGE__->table("fileTypeMimeTypes");

=head1 ACCESSORS

=head2 filetypeid

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0

=head2 mimetype

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "filetypeid",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0 },
  "mimetype",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</filetypeid>

=item * L</mimetype>

=back

=cut

__PACKAGE__->set_primary_key("filetypeid", "mimetype");

=head1 RELATIONS

=head2 filetypeid

Type: belongs_to

Related object: L<MyApp::Schema::Result::FileType>

=cut

__PACKAGE__->belongs_to(
  "filetypeid",
  "MyApp::Schema::Result::FileType",
  { filetypeid => "filetypeid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:970RBiFLfEeI9TuU3qoFAw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
