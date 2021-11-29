#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  some-example5.pl
#
#        USAGE:  ./some-example5.pl
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


my $names = 'Fred or Barney';

if( $names =~ m/(\w+) and (\w+)/ ) { # Нет совпадения
 say  "I saw $1 and $2";

}