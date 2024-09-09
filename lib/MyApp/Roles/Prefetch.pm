package MyApp::Roles::Prefetch;
use Moose::Role;
use Mojo::Collection qw(c);
use feature qw(signatures);

requires qw(search_rs result_source);

has relations => (
  is => 'rw',
  isa => 'Mojo::Collection',
  lazy => 1,
  builder => '_build_relations',
);

sub fetch_all($self) {
  $self->search_rs(
    {},
    {
      prefetch => [$self->result_source->relationships],
      collapse => 1,
    }
  );
}

sub second_degree($self) {
  my $source = $self->result_source;
  my $sch = $source->schema;
  my $rels = c(map { $source->relationship_info($_) } $source->relationships);

  $rels->each(
    sub($rel, $idx) {
      my $source = $sch->source($rel->{source});
      $rel->{relations} = c(
        map { $source->relationship_info($_) } $source->relationships
      );
    }
  );
}

#TODO: recurse into n degrees getting new relations
sub relation_with_degree($self, $n) {
  my $next = sub($coll) {
    my $next_rels = c();

    $coll->each(
      sub($rel, $idx) {
        my $sch = $self->result_source->schema;
        my $source = $sch->source($rel->{source});
        $rel->{relations} = c(
          map { $source->relationship_info($_) } $source->relationships
        );
        push @$next_rels, $rel->{relations}->uniq->to_array->@*;
      }
    );
    return $next_rels;
  };

  my $coll = $self->relations;
  for (1..$n) { $coll = $next->($coll); }
  return $coll;
}

sub _build_relations($self) {
  my $source = $self->result_source;
  my $sch = $source->schema;
  return c(map { $source->relationship_info($_) } $source->relationships);
}

1;
