#!perl

use strict;
use warnings;

use Test::More;
use File::Find;

my @modules;
find(
  sub {
    return if $File::Find::name !~ /\.pm\z/;
    push @modules, $File::Find::name;
  },
  'lib',
);
my @scripts = glob "bin/*";

plan tests => scalar(@modules) + scalar(@scripts);

foreach my $file ( @modules ) {
    my $module = $file;
    $module =~ s{^lib/}{};
    $module =~ s{[/\\]}{::}g;
    $module =~ s/\.pm$//;
    is( qx{ $^X -Ilib -m$module -e "print '$module ok'" }, "$module ok", "$module loaded ok" );
}

SKIP: {
    eval "use Test::Script; 1;";
    skip "Test::Script needed to test script compilation", scalar(@scripts) if $@;
    foreach my $file ( @scripts ) {
        my $script = $file;
        $script =~ s!.*/!!;
        script_compiles_ok( $file, "$script script compiles" );
    }
}
