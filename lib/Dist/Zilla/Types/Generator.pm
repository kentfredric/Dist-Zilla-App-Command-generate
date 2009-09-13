package Dist::Zilla::Types::Generator;

# ABSTRACT: A Few validation types for generation.
#
use strict;
use warnings;
use MooseX::Types::Moose qw( :all );
use MooseX::Types -declare => [
  qw(
    Command
    DistName
    GeneratorPackageName
    )
];

=head1 TYPES

=head2 Command

=head2 DistName

=head2 GeneratorPackageName

=cut

=head1 GOOFY TRICKS AND ENV VARS

There are various values of package name/distname/command that will for whatever reason be invalid based on our criteria.

Generally, you have 2 options.

=over 4

=item 1. Report a bug, lamenting and excusing your choice of insane characters.

This option makes the most sense, because we try to be rational intelligent people, and if you have a decent usecase for your characters, we'll put them in the list.

=item 2. Set an ENV variable to override us on a global scale.

This is option is pretty crack fueled. We use lots of compile-time constantization to ensure it works exactly as *you* perscribe, and have the power to say "damned be everyone else, I know better"
and have nobody able to override you. But when you do this, you get no support, no hand holding, period. These options are your risks, you take them.

Also, Because these options are so hiddeously  awful, if you use them, there should be no way to get rid of them again at runtime.
and if you don't use them, it should be impossible to enable them at runtime. You the user are in charge after all, not some prissy bit of code.

CAVEAT: Its possible that a module could get in before you, and change %ENV before loading this one,
resulting in unchangeable side effects. That is bad, modules shouldn't do that.

You can override it by loading this module before that package, thus getting the compiletime constantization inlined first,
and having that package emit a shower of sparks when it cant handle your jandal.

=back

=head2 ENV VARS

=head3 DZ_GENERATOR_PERMIT_BAD_COMMAND

Set this to > 1 to permit arbitrary commands. This is likely useless.

=head3 DZ_GENERATOR_PERMIT_BAD_DISTNAME

Set this to > 1 to permit weird dist names. This will likely result in people on CPAN hating you.

=head3 DZ_GENERATOR_PERMIT_BAD_PACKAGENAME

Set this to > 1 to permit insane module names. Be prepared and carry a firesuit at all times.

=cut

=head2 HACKING AROUND MISBEHAVING MODULES THAT DO INSANE THINGS LIKE SET ENV TO SOMETHING SANE.

  DZ_GENERATOR_PERMIT_BAD_PACKAGENAME=1 PERL5OPT='-MDist::Zilla::Types::Generator'  $whatever

It will likely explode. You've been warned.

=cut

use constant _badCommand              => 'DZ_GENERATOR_PERMIT_BAD_COMMAND';
use constant _badCommandPermitted     => ( exists $ENV{ _badCommand() } and $ENV{ _badCommand() } > 0 );
use constant _badDistName             => 'DZ_GENERATOR_PERMIT_BAD_DISTNAME';
use constant _badDistNamePermitted    => ( exists $ENV{ _badDistName() } and $ENV{ _badDistName() } > 0 );
use constant _badPackageName          => 'DZ_GENERATOR_PERMIT_BAD_PACKAGENAME';
use constant _badPackageNamePermitted => ( exists $ENV{ _badPackageName() } and $ENV{ _badPackageName() } > 0 );

subtype Command, as Str, where { _badCommandPermitted() || $_ =~ m/^[-a-zA-Z0-9_]+$/ }, message {
  'Command Str has wierd characters in it, and this makes for useless commands.' . 'Set ' . _badCommand() . ' to force';
};

subtype DistName, as Str, where { _badDistNamePermitted() || $_ =~ m/^[a-zA-Z][-a-zA-Z]+$/ }, message {
  'DistName Str has Characters that are neither letters or hyphens, or it starts with a non-letter.'
    . 'This is not recommended.' . 'Set '
    . _badDistName()
    . ' to force';
};
subtype GeneratorPackageName, as Str, where { _badPackageNamePermitted() || $_ =~ m/^[a-zA-Z][:a-zA-Z]+$/ }, message {
  'GeneratorPackageName Str has Characters that are neither letters or colons, or it starts with a non-letter. '
    . 'This is not recommended. ' . 'Set '
    . _badPackageName()
    . ' to force';
};

1;

