use utf8;
package MyApp::Schema::Result::Setting;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Setting

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

=head1 TABLE: C<settings>

=cut

__PACKAGE__->table("settings");

=head1 ACCESSORS

=head2 setting

  data_type: 'text'
  is_nullable: 0

=head2 key

  data_type: 'text'
  is_nullable: 0

=head2 value

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "setting",
  { data_type => "text", is_nullable => 0 },
  "key",
  { data_type => "text", is_nullable => 0 },
  "value",
  { data_type => "", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</setting>

=item * L</key>

=back

=cut

__PACKAGE__->set_primary_key("setting", "key");


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gfHFG4+MKG+Mo3/ya6KmGQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
