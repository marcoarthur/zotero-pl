package MyApp::Roles::FullTextSearch;
use Moose::Role;
use Mojo::Collection qw(c);
use feature qw(signatures);
use List::Util qw(any);
use DDP;

our $DEBUG_FTS = 1;

has dbh => (
  is      => 'ro',
  isa     => 'DBI::db',
  lazy    => 1,
  default => sub ($self) { 
    $self->result_source->schema->storage->dbh;
  },
);

has source => (
  is    => 'ro',
  isa   => 'DBIx::Class::ResultSource::Table',
  lazy  => 1,
  default => sub ($self) { $self->result_source },
);

has fts_targets => (
  is      => 'rw',
  isa     => 'ArrayRef[Str]',
  lazy    => 1,
  default => sub ($self){ $self->_text_cols },
);

has result_limit => (
  is => 'rw',
  isa => 'Int',
  lazy => 1,
  default => sub { 10 },
);

sub fts_tbl($self) { return $self->source->name . '_fts'}
sub fts_info($self) {
  return {
    fts_tbl  => $self->fts_tbl,
    self_tbl => $self->result_source->from,
  };
}

# all possible text columns for fts
sub _text_cols($self) {
  my $info = $self->source->columns_info;
  my @pks = $self->source->primary_columns;
  # select text data_type
  my @text_cols = grep { $info->{$_}{data_type} =~ /text/i } keys %$info;

  # but remove any primary keys
  my %cols;
  @cols{@text_cols} = ();
  delete @cols{@pks}; @text_cols = keys %cols;

  p @text_cols if $DEBUG_FTS;
  return c(@text_cols);
}

# check if table for fts exists
sub _has_fts_tbl($self) {
  my $info = $self->fts_info;

  my $CHK_STM =<<~"SQL";
  SELECT 1 FROM $info->{fts_tbl};
  SQL
  eval {
    $self->dbh->prepare($CHK_STM)->execute;
  };

  return $@ ? 0 : 1;
}

sub fts($self, $query) {
  $self->_create_fts_table unless $self->_has_fts_tbl;

  my $ids = $self->_do_search_fts($query);

  my @pks = $self->source->primary_columns;
  my %q;
  for(my $i = 0; $i < @pks; $i++) {
    $q{'me.' . $pks[$i]} = $ids->map(sub { $_->[$i] })->to_array;
  }
  p %q if $DEBUG_FTS;
  
  return $self->search_rs({ %q });
}

sub _do_search_fts($self, $query) {
  my $fts = $self->fts_tbl;
  my $pks = join ",", $self->source->primary_columns;
  my $cols = $self->fts_targets;
  my $where = join ' OR ', map { "${_}_fts MATCH '$query'" } @{$self->fts_targets};

  my $stm = <<~"SQL";
    SELECT  $pks
    FROM    $fts
    WHERE   $where
  SQL
  p $stm if $DEBUG_FTS;

  my $sth = $self->dbh->prepare($stm);
  $sth->execute;
  my $ids = c();

  while(my $row = $sth->fetchrow_arrayref){
    push @$ids, [@$row] ;
  }

  $ids = $ids->uniq;
  return $ids;
}

sub _create_fts_table($self) {
  my $targets = $self->fts_targets;
  my $info = $self->fts_info;
  my @pks  = $self->source->primary_columns;
  my @fts  = map { "${_}_fts" } @$targets;
  my $col_list = join ",",@pks, @fts;


  $self->dbh->do(<<~"EOS") or die $@;
    CREATE VIRTUAL TABLE $info->{fts_tbl} USING fts4($col_list)
  EOS
  $self->_populate();
}

sub _populate($self) {
  my $targets = $self->fts_targets;
  my $info = $self->fts_info;
  my @pks = $self->source->primary_columns;

  my $fts_list = join ",", @pks, map { "${_}_fts" } @$targets;
  my $col_list = join ",", @pks, @$targets;

  $self->dbh->do(<<~"EOS") or die $@;
    INSERT INTO $info->{fts_tbl}($fts_list) SELECT $col_list FROM $info->{self_tbl};
  EOS

  #TODO: triggers to insert/update/delete into fts to keep update
}

sub drop_fts($self) {
  my $info = $self->fts_info;

  $self->dbh->do(<<~"EOS") or die $@;
    DROP TABLE $info->{fts_tbl};
  EOS
}

1;
