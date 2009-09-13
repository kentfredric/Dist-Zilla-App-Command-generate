
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-App-Command-generate',
  NAME      => 'Dist::Zilla::App::Command::generate',
  AUTHOR    => 'Kent\ Fredric\ \<kentnl\ at\ cpan\.org\>',
  ABSTRACT  => 'Generate\ your\ dist\/dist\ parts\ from\ custom\ global\ templates\.',
  VERSION   => '0.01000001',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0',
  },
);
