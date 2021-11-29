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
    #Даже если bronto отсутствует в строке, эта часть шаблона соответствуQ ет переменной $1.

}else {
    print "Fred wants a $1\n";
}

#
# в регулярных выражениях Perl предусмотрена возможность использования круглых скобок исключительно для группировки,
#  без сохранения данных в памяти. Такие круглые скобки называются несохраняющими, а при их записи используется
# особый синтаксис.
# После открывающей скобки ставится вопросительный знак и двоеточие (?:) тем самым вы сообщаете Perl,
# что круглые скобки будут исQ пользоваться только для группировки.
#
if ($other_text =~ /(?:bronto)?saurus (steak|burger)/i) {
    print "\$2 Fred wants a $2\n";
    print "\$1 Fred wants a $1\n";
    print "\$1 again = $1\n";
    #Даже если bronto отсутствует в строке, эта часть шаблона соответствует переменной $1.

}else {
    print "again Fred wants a $1\n";
}

if (/(?:bronto)?saurus (?:BBQ )?(steak|burger)/) {

    print "\$2 Fred wants a $2\n";
    print "\$1 Fred wants a $1\n";
    print "\$1 again = $1\n";
    #     $2 Fred wants a
    #     $1 Fred wants a steak
    #     $1 again = steak
    #     Use of uninitialized value $_ in pattern match (m//) at some-example4.pl line 65.


}