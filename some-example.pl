#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  some-example.pl
#
#        USAGE:  ./some-example.pl
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


#Разбираюсь в однострочниках


print "Уважаешь Perl ? \n";

printf("%s\n", <STDIN> =~ /\by[es]*\b/i ? "КРАСАВЧЕг!": "Давайдосвидания");

# однострочник для Windows perl -e "printf(\"%s\n\", <STDIN> =~ /\by[es]*\b/i ? \"SUPER\": \"BUY\")"
# и для Linux  perl -e 'printf("%s\n", <STDIN> =~ /\by[es]*\b/i ? "SUPER": "BUY")'





