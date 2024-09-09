use utf8;
package MyApp::Schema::Result::Feed;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Feed

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

=head1 TABLE: C<feeds>

=cut

__PACKAGE__->table("feeds");

=head1 ACCESSORS

=head2 libraryid

  data_type: 'integer'
  is_auto_increment: 1
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 url

  data_type: 'text'
  is_nullable: 0

=head2 lastupdate

  data_type: 'timestamp'
  is_nullable: 1

=head2 lastcheck

  data_type: 'timestamp'
  is_nullable: 1

=head2 lastcheckerror

  data_type: 'text'
  is_nullable: 1

=head2 cleanupreadafter

  data_type: 'int'
  is_nullable: 1

=head2 cleanupunreadafter

  data_type: 'int'
  is_nullable: 1

=head2 refreshinterval

  data_type: 'int'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "libraryid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_foreign_key    => 1,
    is_nullable       => 0,
  },
  "name",
  { data_type => "text", is_nullable => 0 },
  "url",
  { data_type => "text", is_nullable => 0 },
  "lastupdate",
  { data_type => "timestamp", is_nullable => 1 },
  "lastcheck",
  { data_type => "timestamp", is_nullable => 1 },
  "lastcheckerror",
  { data_type => "text", is_nullable => 1 },
  "cleanupreadafter",
  { data_type => "int", is_nullable => 1 },
  "cleanupunreadafter",
  { data_type => "int", is_nullable => 1 },
  "refreshinterval",
  { data_type => "int", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</libraryid>

=back

=cut

__PACKAGE__->set_primary_key("libraryid");

=head1 UNIQUE CONSTRAINTS

=head2 C<url_unique>

=over 4

=item * L</url>

=back

=cut

__PACKAGE__->add_unique_constraint("url_unique", ["url"]);

=head1 RELATIONS

=head2 libraryid

Type: belongs_to

Related object: L<MyApp::Schema::Result::Library>

=cut

__PACKAGE__->belongs_to(
  "libraryid",
  "MyApp::Schema::Result::Library",
  { libraryid => "libraryid" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J4PdgjtXXnSb9vFxKb0GzA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
