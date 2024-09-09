use utf8;
package MyApp::Schema::Result::FieldsCombined;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::FieldsCombined

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

=head1 TABLE: C<fieldsCombined>

=cut

__PACKAGE__->table("fieldsCombined");

=head1 ACCESSORS

=head2 fieldid

  data_type: 'int'
  is_nullable: 0

=head2 fieldname

  data_type: 'text'
  is_nullable: 0

=head2 label

  data_type: 'text'
  is_nullable: 1

=head2 fieldformatid

  data_type: 'int'
  is_nullable: 1

=head2 custom

  data_type: 'int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "fieldid",
  { data_type => "int", is_nullable => 0 },
  "fieldname",
  { data_type => "text", is_nullable => 0 },
  "label",
  { data_type => "text", is_nullable => 1 },
  "fieldformatid",
  { data_type => "int", is_nullable => 1 },
  "custom",
  { data_type => "int", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</fieldid>

=back

=cut

__PACKAGE__->set_primary_key("fieldid");

=head1 RELATIONS

=head2 item_datas

Type: has_many

Related object: L<MyApp::Schema::Result::ItemData>

=cut

__PACKAGE__->has_many(
  "item_datas",
  "MyApp::Schema::Result::ItemData",
  { "foreign.fieldid" => "self.fieldid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07052 @ 2024-07-18 16:40:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ek7VRhZhZDo7YUW6PrDw5g


with qw/ MyApp::Roles::AsHash /;
# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
