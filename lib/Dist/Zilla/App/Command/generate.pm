use strict;
use warnings;

package Dist::Zilla::App::Command::generate;
our $VERSION = '0.01000001';


# ABSTRACT: Generate your dist/dist parts from custom global templates.

use Dist::Zilla::App -command;


sub abstract { 'Generate your dist/dist parts from custom global templates' }



1;


__END__

=pod

=head1 NAME

Dist::Zilla::App::Command::generate - Generate your dist/dist parts from custom global templates.

=head1 VERSION

version 0.01000001

=head1 SYNOPSIS

Similar to L<Dist::Zilla::App::Command::new> , except extensible, pluggable, with a system of defaults.

  dzil generate [pragma] @flags
  dzil generate dist -name Foo-Bar ; # -from is instead defaulted

This is intended to have alternative pragmas, like L<Module::New>, but be pluggable, and pluggable on a per-dist basis. ( Allowing you to have dist-centric generators ).

=head1 EXAMPLE

  dzil generate dist -name Foo-Bar ; # -from is instead defaulted
  dzil generate dist -name Foo-Bar -from mytemplate ;



=head1 AUTHOR

  Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


