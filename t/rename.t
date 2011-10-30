#!/usr/bin/perl

use strict;
use warnings;
use lib 't/lib';

BEGIN {

    package Test::Kit::Tester;
    use Test::More tests => 2;
    require Test::Kit;

    #
    # test composition
    #

    Test::Kit->import( 'Test::More',
        'NaughtyTest' => { rename => { ok => 'naughty_ok', } }, );

    # Fake our existence
    $INC{'Test/Kit/Tester.pm'} = __FILE__;
}


use Test::Kit::Tester;

ok 1, '... and the Test::More functions should be exported';
naughty_ok();    # named from NaughtyTest::ok
