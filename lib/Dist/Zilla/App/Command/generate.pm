use strict;
use warnings;

package Dist::Zilla::App::Command::generate;

# ABSTRACT: Generate your dist/dist parts from custom global templates.

use Dist::Zilla::App -command;

=head1 SYNOPSIS

Similar to L<Dist::Zilla::App::Command::new> , except extensible, pluggable, with a system of defaults.

  dzil generate [pragma] @flags
  dzil generate dist -name Foo-Bar ; # -from is instead defaulted

This is intended to have alternative pragmas, like L<Module::New>, but be pluggable, and pluggable on a per-dist basis. ( Allowing you to have dist-centric generators ).
=cut

sub abstract { 'Generate your dist/dist parts from custom global templates' }

=head1 EXAMPLE

  dzil generate dist -name Foo-Bar ; # -from is instead defaulted
  dzil generate dist -name Foo-Bar -from mytemplate ;

=cut


1;

