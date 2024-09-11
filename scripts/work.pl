#!/usr/bin/env perl

use Mojo::Base -strict, -signatures;
use Mojo::File qw(path);
use Mojo::Collection qw(c);
use Mojo::Util;
use DDP;

my $lib     = path('./lib');
my $modules = $lib->list_tree->grep( sub { $_->extname eq 'pm' } );
my $specialized = $modules->grep( sub { $_ =~ qr|lib/MyApp/Schema/ResultSet/.*$| } );
my $sources = $modules->grep( sub { $_ =~ qr|lib/MyApp/Schema/Result/.*$| } );

my %all;
@all{ @$sources } = 1;
delete @all{ @$specialized };
my $left = c(keys %all)->map(sub{Mojo::File->new($_)});

my $new_mods = $left->map(
  sub ($file) {
    my $mod_name = join '::', @{$file->to_array}[1,2,3,4];
    $mod_name =~ s/Result/ResultSet/;
    $mod_name =~ s/\.pm$//;
    my $fname =  ($file =~ s/Result/ResultSet/r);
    { file => Mojo::File->new($fname), module => $mod_name };
  }
);

$new_mods->each(
  sub ($mod, $idx) {
    my $code =<<~"EOC";
    package $mod->{module};
    use Moose;
    use feature qw(signatures);
    extends 'DBIx::Class::ResultSet';
    with qw/ MyApp::Roles::Prefetch MyApp::Roles::CommonSense /;
    1;
    EOC

    say "writing $mod->{file}";
    $mod->{file}->spew($code) unless -f $mod->{file};
  }
);
