package Dist::Zilla::Types::Generator;
our $VERSION = '0.01000001';


# ABSTRACT: A Few validation types for generation.
#
use strict;
use warnings;
use MooseX::Types::Moose qw( :all );
use MooseX::Types -declare => [
  qw(
    Command
    )
];

subtype Command, as Str, where { $_ =~ m/^[-a-zA-Z0-9_]+$/ }, message { "Command Str has wierd characters in it" };

1;


__END__

=pod

=head1 NAME

Dist::Zilla::Types::Generator - A Few validation types for generation.

=head1 VERSION

version 0.01000001

=head1 AUTHOR

  Kent Fredric <kentnl at cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Kent Fredric.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


