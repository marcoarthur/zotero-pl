package MyApp::Model::Zotero;
use Mojo::Base "Mojo::EventEmitter", -signatures;
our $VERSION = "0.001";

use MyApp::Schema;
use Mojo::Util qw(decamelize);
use Carp qw(croak);
use MyApp::Conf;
use Mojo::Loader qw(load_class);

has _schema => sub ($me) { 
  state $sch = MyApp::Schema->connect(
    $me->conf->db->{dsn},
    $me->conf->db->{user} || undef,
    $me->conf->db->{password} || undef,
    $me->conf->db->{opts} || {},
  );
};

has conf => sub { state $conf = MyApp::Conf->new };

sub _install_sources( $self ) {
  my @sources = $self->_schema->sources;
  do {
    my $camel = $_;
    my $snake = decamelize($camel);

    $self->attr(
      $snake => sub {
        my $class = "MyApp::Model::$camel";
        if ( my $e = load_class($class) ) {
          croak "No class found for $class";
        }
        return $class->new( 
          rs => $self->_schema->resultset($camel),
        );
      }
    );
  } for @sources;
}

sub new($class, @args) {
  my $self = $class->SUPER::new(@args);
  $self->_install_sources;
  $self;
}

1;

__END__
