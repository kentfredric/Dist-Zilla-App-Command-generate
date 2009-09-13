use strict;
use warnings;

package Dist::Zilla::Role::Generator;
our $VERSION = '0.01000001';


# ABSTRACT: A Role for defining keywords Dist::Zilla::App::Command::generate

use Moose::Role;
use Dist::Zilla::Types::Generator qw( :all );
use namespace::autoclean;



with 'Dist::Zilla::Role::Plugin';


requires 'generator_family';

sub _get_generator_family {
  my ( $self ) = @_ ;
  my $result = $self->generator_family();
  Command()->assert_valid( $result );
  return $result;
}

1;


__END__

=pod

=head1 NAME

Dist::Zilla::Role::Generator - A Role for defining keywords Dist::Zilla::App::Command::generate

=head1 VERSION

version 0.01000001

=head1 SYNOPSIS

  use strict;
  use warnings;
  package Dist::Zilla::Role::Generator::foo;

  use Moose::Role;
  with 'Dist::Zilla::Role::Generator';

  sub generator_family { 'foo' }

  1;

Generates the primary tokens for the command

  dzil generate

The above defines the subcommand

  dzil generate foo



=head1 USED ROLES

This Module implements L<Dist::Zilla::Role::Plugin>



=head1 REQUIRED METHODS

=head2 generator_family

this sub must contain the pragma passed to

  dzil generate

to determine what it is we are generating.

Must return a space free string.



=head1 AUTHOR

  Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


