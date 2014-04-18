#!/usr/bin/perl -Tw

use strict;
use Test::More tests => 2;

use UNIVERSAL::require;

my $tainted = $0;
$tainted =~ s/\A.*\z/bananas/;

ok !eval { $tainted->require or die $@ };
like $@, '/^Insecure dependency in require /';
