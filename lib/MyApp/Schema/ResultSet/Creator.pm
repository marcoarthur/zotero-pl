package MyApp::Schema::ResultSet::Creator;
use strict;
use warnings;
use feature qw(signatures);
use base 'DBIx::Class::ResultSet';
use DateTime;
#with 'Throwable';

sub by_subject($self, $subject) {
  # TODO: check subject
  $subject = join '', '%', $subject, '%';
  return $self->search_rs(
    {},
    {
      join => { 
        item_creators => {itemid => { item_datas => 'valueid' }}
      },
      '+select' => [qw/valueid.value itemid.dateadded/],
      '+as' => [qw/item_value date_added/],
      where => { 'valueid.value' => { like => $subject } },
      order_by => { -asc => 'itemid.dateadded' },
    }
  );
}

sub items_from($self, $creator) {
  #TODO: check args

  return $self->search_rs( 
    $creator, 
    {
      join => { item_creators => 'itemid' },
      '+select' => [ qw/item_creators.itemid itemid.dateadded/],
      '+as' => [ qw/item_id date_added/ ],
    }
  );
}

sub recent_added($self) {
  my $date = DateTime->now->subtract(days => 30);
  my $parser = $self->result_source->schema->storage->datetime_parser;
  return $self->items_from({})
  ->search_rs({}, 
    { 
      where => { 'itemid.dateadded' => { '>' => $parser->format_datetime($date) } } 
    }
  );
}

sub by_type($self, $type) {
  #TODO: check args
  return $self->search_rs(
    {},
    {
      join => { item_creators => 'creatortypeid' },
      '+select' => [ qw/creatortypeid.creatortype/ ],
      '+as' => [ qw/type/ ],
      where => { 'creatortypeid.creatortype' => $type },
    }
  );
}

# sub by_date_added($self, $date=undef) {
#   $date = DateTime->now->subtract(days => 90) unless $date;

#   return $self->search_rs(
#     {},
#     {
#       join => {}
#     }
#   )
# }

1;
