package MyApp::Schema::ResultSet::ItemAnnotation;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

with qw( MyApp::Roles::Prefetch MyApp::Roles::CommonSense MyApp::Roles::RxPage);

sub after_date($self, $date) {
  my $dtf = $self->result_source->schema->storage->datetime_parser;
  return $self->search_rs(
    { 
      'itemid.dateadded' => { '>' =>  $dtf->format_datetime($date) },
    },
    {
      prefetch  => [qw(itemid)],
      collapse  => 1,
      order_by  => { -desc => 'itemid.dateadded' },
    }
  );
}

sub before_date($self, $date) {
  my $dtf = $self->result_source->schema->storage->datetime_parser;
  return $self->search_rs(
    { 
      'itemid.dateadded' => { '<' =>  $dtf->format_datetime($date) },
    },
    {
      prefetch  => [qw(itemid)],
      collapse  => 1,
      order_by  => { -desc => 'itemid.dateadded' },
    }
  );
}

sub between_dates($self, $bottom, $upper) {
  die "between(bottom, upper) dates, but $bottom > $upper" if $bottom > $upper;
  return $self->before_date($upper)->after_date($bottom);
}

sub from_book_id($self, $book_id) {
  return $self->search_rs(
    {
      'type.typename' => 'book',
      'item_datas.fieldid' => 110,
      'item_datas.itemid' => $book_id,
    },
    {
      prefetch => [ 
        {
          parentitemid => # annotation attachment
          {
            parentitemid => [qw/type/, { item_datas => 'valueid' }],
          } 
        } 
      ],
      collapse => 1,
    }
  );
}

1;
