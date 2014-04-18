#!perl

use strict;
use warnings;
use Test::More 0.88 tests => 3;
use UNIVERSAL::require;

my $module;

$module = '42';
eval { $module->require };
ok($@ && $@ =~ /invalid module name/,
   "module name can't start with a digit");

$module = 'Foo Bar';
eval { $module->require };
ok($@ && $@ =~ /invalid module name/,
   "module name can't contain a space character");

$module = 'strict; print "hello :-)\n"';
eval { $module->require };
ok($@ && $@ =~ /invalid module name/,
   "module name can't contain semi-colon or double quotes or a space");

