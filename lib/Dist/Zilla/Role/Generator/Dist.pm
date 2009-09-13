use strict;
use warnings;

package Dist::Zilla::Role::Generator::Dist;

# ABSTRACT: A Role for 'dist' generator extensions

use Moose::Role;
use Dist::Zilla::Types::Generator qw( :all );
use MooseX::Types::Moose qw( :all );

with 'Dist::Zilla::Role::Generator';

has 'name' => ( isa => DistName, is => 'rw', required => 1 );

=head1 METHODS

=head2 generator_family

Tells dzil generate that it can take a 'dist' subcommand.

=cut

sub generator_family { 'dist' }

1;

