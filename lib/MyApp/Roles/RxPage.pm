package MyApp::Roles::RxPage;
use Moose::Role;
use Carp qw(croak carp);
use feature qw(signatures);
use RxPerl::Mojo ':all';

=head1 NAME

MyApp::Roles::RxPage - Role to add rx_search to ResultSets

=head1 SYNOPSIS

  package MyApp::Schema::ResultSet::Item;
  use Moose;
  use feature qw(signatures);
  extends 'DBIx::Class::ResultSet';

  with qw/MyApp::Roles::RxPage/;


=cut

requires qw( search_rs );

our $DEBUG_MODULE = 0;

=head1 ATTRIBUTES

=over 4

=item page_size

size of the paged result non negative integer.

=back

=cut

has page_size => (
  is => 'rw',
  isa => 'Int',
  lazy => 1,
  default => sub { 10 },
);


=head1 METHODS

=head2 rx_search

=over 4

=item Arguments: None

=item Return Value: L<$observable|/RxObservable>

=back

Run a search and returning a paged reactive observable, that can be later
subscribed. Example:

  my $items = $sch->resultset('Item')->search_rs(undef);

  $items->page_size(50); #set page size to 50

  # get all items in pages of 50 items
  $items->rx_search->subscribe(
    { next => sub { p $_ } }
  );

=cut

sub rx_search($self) {
  my $search = $self->search_rs(
    undef, 
    {
      rows => $self->page_size,
      page => 1,
    }
  );
  my $pager  = $search->pager;

  # fetch the items of the page numbered $page
  my $fetch_page = sub ($page=1) {
    return rx_of(1)->pipe(
      op_map_to( $search ),
      op_tap(
        sub { 
          carp sprintf("page: %d, page_size: %d ",$page, $self->page_size) if $DEBUG_MODULE 
        }
      ),
      op_map(
        sub {
          my $page_results = $_->page($page);
          return {
            items     => [$page_results->all],
            next_page => $page < $pager->last_page ? $page + 1 : undef
          };
        }
      )
    );
  };

  # get items from page
  my $get_items;
  $get_items = sub($page=1) {
    return rx_defer(
      sub {
        return $fetch_page->($page)->pipe(
          op_merge_map(
            sub {
              my ($items, $next_page) = @$_{qw/items next_page/};
              my $nitems = rx_from($items);
              my $next   = $next_page ? $get_items->($next_page) : rx_EMPTY;
              return rx_concat($nitems, $next);
            }
          )
        )
      }
    );
  };

  # create the observable for search
  return $get_items->();
}

1;
