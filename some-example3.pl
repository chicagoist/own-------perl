#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  some-example3.pl
#
#        USAGE:  ./some-example3.pl
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


my $wilma =~ /(\w+)/; # BAD! Untested match result
print "Wilma's word was $1... or was it?\n";

#
# Use of uninitialized value $wilma in pattern match (m//) at some-example3.pl line 39.
# Use of uninitialized value $1 in concatenation (.) or string at some-example3.pl line 40.

# причина, по которой поиск по шаблону почти всегда размещается в условии
# if или while:

if ($wilma =~ /(\w+)/) {
    print "Wilma's word was $1.\n";
}else {
    print "Wilma doesn't have a word.\n";
}
# Use of uninitialized value $wilma in pattern match (m//) at some-example3.pl line 49.
# Wilma doesn't have a word.


my $wilma_word;
if ($wilma =~ /(\w+)/) {
    $wilma_word = $1;
}
print "\$wilma_word = $wilma_word\n";
