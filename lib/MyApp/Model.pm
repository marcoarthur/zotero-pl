package MyApp::Model;
use Mojo::Base "Mojo::EventEmitter", -strict, -signatures;
use Mojo::IOLoop;
use RxPerl::Mojo ':all';
use Carp qw(croak);
use Syntax::Keyword::Try;

has rs => sub { croak "Need a ResultSet" };
has rclass => sub ($self) { return $self->rs->result_class; };
has default_rclass => sub { 'DBIx::Class::ResultClass::HashRefInflator'; };
has limit => sub { 1000 };
has test => sub { 0 };

sub search($self, $class = undef) { 
  # if in test mode, limit rows
  if ($self->test) {
    $self->limit(10);
  }
  my $rs = $self->rs->search({}, { rows => $self->limit });
  $rs->result_class($class) if $class;
  return rx_from([ $rs->all ]);
}

sub create_new($self, $data) {
  my $source = $self->rs->result_source;
  try { $self->rs->create_or_update($data); } 
  catch ($e) {
    croak "Error creating new model for $source $e";
  }
}

1;
