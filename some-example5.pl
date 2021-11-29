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
 # You don’t see the message from say, because the string has an or  where you were expecting an and.
}

if( $names =~ m/(\w+) (and|or) (\w+)/ ) { # Теперь совпадение есть
 say "I saw $1 and $2";
 # Oops! You see a message this time, but it doesn’t have the second name in it because you added another
 # set of capture parentheses. The value in $2 is from the alternation and the second name is now
 # in $3 (which we don’t output): I saw Fred and or
 say "I saw $1 and $3";
}

if( $names =~ m/(?<name1>\w+) (?:and|or) (?<name2>\w+)/ ) {

 say "I saw $+{name1} and $+{name2}";
 #
 # Совпавший текст сохраняется в хеше с именем %+: ключом является метка (то есть имя совпадения),
 # а значением – совпавшая часть строки. Первому частичному совпадеQ нию присваивается метка name1,
 # второму – name2, а для получения их значений используются конструкции $+{name1} и $+{name2}

}