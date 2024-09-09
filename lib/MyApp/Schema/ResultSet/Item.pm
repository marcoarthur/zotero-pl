package MyApp::Schema::ResultSet::Item;
use Moose;
use feature qw(signatures);
extends 'DBIx::Class::ResultSet';

sub by_tag($self, @tags) {
  my @titles = qw/
  blogTitle
  bookTitle
  dictionaryTitle
  encyclopediaTitle
  forumTitle
  proceedingsTitle
  programTitle
  publicationTitle
  seriesTitle
  shortTitle
  title
  websiteTitle
  url
  /;

  $self->search_rs(
    {},
    {
      join => [
        {item_tags => 'tagid'},                 # all tags associated
        {item_datas => ['valueid', 'fieldid']}, # all values associated and fields (title)
        'fulltext_item',                        # the fulltext indexed info
      ],
      '+select'=> [ 
        qw/
        valueid.value 
        fulltext_item.indexedpages fulltext_item.totalpages fulltext_item.synced
        fieldid.fieldname fieldid.label
        / 
      ],
      '+as' => [ 
        qw/title pages_indexed total_pages synced field_name label/ 
      ],
      where => 
      { 
        -and => 
        [
          'fieldid.fieldname' => { -in => [@titles] },                # the field we are interested to show
          -or => [map { +{'tagid.name' => { -like => $_ }} } @tags],  # the tags to search for
        ]
      },
      distinct => 1, # since we use OR clause for tags we need this
    }
  );
}

sub by_author($self, $author) {
  #TODO: check input
  # if just string search on both first and last names
  $author = { firstname => $author, lastname => $author } unless ref $author;

  $self->search_rs(
    {},
    {
      join => [
        {item_creators => 'creatorid'},
      ],
      '+select' => [
        qw/creatorid.firstname creatorid.lastname/
      ],
      '+as' => [ qw/author_firstname author_lastname/ ],
      where => 
      {
        -or => [
          map {
            my $name = $_;
            { "creatorid.$name" => { -like => $author->{$name} } };
          } keys %$author
        ],
      }
    }
  );
}

sub by_words($self, @words) {
  my $word_rs = $self->result_source
  ->schema->resultset('FulltextWord')->search_rs( {word => [@words]} );

  $self->search_rs(
    undef,
    {
      join  => [
        { fulltext_item_words => 'wordid' },
        { item_datas => ['valueid'] },
      ],
      '+select' => [
        { group_concat => 'wordid.word', -as => 'words' },
        { count => 'wordid.word', -as => 'total_words' },
        qw/valueid.value/,
      ],
      '+as' => [qw/words total_words title/],
      where => { 
        'wordid.wordid' => { 
          -in => $word_rs->get_column('wordid')->as_query 
        }
      },
      group_by => 'me.itemid',
      # Technically not a bug, but still:
      # having => {
      #   total_words => {'=' => {count => {distinct => scalar(@words)}}} 
      # },
      #
      # WorkAround, we write the expression +0 to force affinity check
      # https://stackoverflow.com/questions/71066691/dbdsqlite-placeholder-for-integer-value-in-having-clause
      having => \['count(distinct wordid.wordid) = ? + 0', scalar(@words)],
      order_by => { -desc => 'total_words' },
    },
  );
}

sub words($self) {
  $self->search_rs(
    {},
    {
      join => { fulltext_item_words => 'wordid' },
      '+select' => [ 
        { 
          json_group_array => 'wordid.word', -as => 'words'
        },
        { count => 'wordid.word', -as => 'total_words' },
      ],
      '+as' => [qw/words total_words/],
      group_by => 'me.itemid',
      where => {'wordid.word' => { '!=' => undef } },
    }
  );
}

sub books($self) {
  return $self->search_rs(
    {
      'type.typename' => { -like => [ qw/%book%/ ] },
    },
    {
      prefetch => [ qw/type/ ],
      collapse => 1,
    }
  );
}

sub with_annotations($self) {
  return $self->search_rs(
    { 
      'item_annotation.text' => { '!=' => undef }
    },
    {
      prefetch => [ qw/item_annotation/],
    }
  )
}

with qw( MyApp::Roles::Prefetch MyApp::Roles::CommonSense MyApp::Roles::RxPage);
1;
