
use strict;
use warnings;

use Module::Build;

my $build = Module::Build->new(
  module_name   => 'Dist::Zilla::App::Command::generate',
  license       => 'perl',
  dist_abstract => "Generate\ your\ dist\/dist\ parts\ from\ custom\ global\ templates\.",
  dist_name     => "Dist\-Zilla\-App\-Command\-generate",
  dist_author   => [
"Kent\ Fredric\ \<kentnl\ at\ cpan\.org\>",
  ],
  requires      => {
    "Test::More" => '0',
  },
  script_files => [ qw() ],
);

$build->create_build_script;
