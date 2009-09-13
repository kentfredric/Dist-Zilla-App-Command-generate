package Dist::Zilla::Types::Generator;

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

