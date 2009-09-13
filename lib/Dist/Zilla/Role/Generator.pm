use strict;
use warnings;

package Dist::Zilla::Role::Generator;

# ABSTRACT: A Role for defining keywords Dist::Zilla::App::Command::generate

use Moose::Role;
use Dist::Zilla::Types::Generator qw( :all );
use namespace::autoclean;

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

=cut

=head1 USED ROLES

This Module implements L<Dist::Zilla::Role::Plugin>

=cut

with 'Dist::Zilla::Role::Plugin';

=head1 REQUIRED METHODS

=head2 generator_family

this sub must contain the pragma passed to

  dzil generate

to determine what it is we are generating.

Must return a space free string.

=cut

requires 'generator_family';

sub _get_generator_family {
  my ( $self ) = @_ ;
  my $result = $self->generator_family();
  Command()->assert_valid( $result );
  return $result;
}

1;

