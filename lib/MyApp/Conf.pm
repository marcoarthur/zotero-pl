package MyApp::Conf;
use Mojo::Base "Mojo::EventEmitter", -strict, -signatures;
use Mojo::File;
use Mojo::Collection qw(c);
use Carp qw(croak);
use YAML qw(LoadFile);

has _cwd => sub {my $cwd = $ENV{CWD} || '.' };

has _files => sub ($self) {
  state $files = Mojo::File->new($self->_cwd)
  ->list_tree({hidden => 1, max_depth => 3})
  ->grep(
    sub { $_->extname =~ m/y(a)?ml/ }
  );
};

has conf => sub { croak "Need configuration" };

has _policy => sub { 1 };

has _default => sub {
  return {
    db => {
      dsn => 'dbi:SQLite:./zotero.sqlite',
    },
    opts => {

    },
  };
};

sub new($class, @args) { 
  my $self = $class->SUPER::new(@args);
  $self->_setup;
  $self;
}

sub _setup($self) {
  #install default
  if ($self->_files->size  == 0) {
    $self->conf($self->_default);
  } else {
    $self->conf(LoadFile($self->_files->first) or croak "Conf parse error $!");
  }
  # install configuration
  do {
    my $attr = $_;
    $self->attr($attr => sub { $self->conf->{$attr} });
  } for keys $self->conf->%*;
}

1;
