#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  some-example4.pl
#
#        USAGE:  ./some-example4.pl
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Valerii Dubkoff
#      COMPANY:  
#      VERSION:
#      CREATED:
#     REVISION:  ---
#===============================================================================

# https://github.com/chicagoist/Exercises_From_LearningPerl.git
# https://www.learning-perl.com/
# https://www.linkedin.com/in/legioneroff/


use 5.10.0;
use strict;
use open qw(:std :encoding(UTF-8));
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
use utf8;
use warnings;
use POSIX;


#Разбираюсь в regex

my $other_text = "tyranosaurus steak";
if ($other_text =~ /(bronto)?saurus (steak|burger)/i) {
    print "Fred wants a $2\n";
    print "\$1 = $1\n";

}else {
    print "Fred wants a $1\n";
}