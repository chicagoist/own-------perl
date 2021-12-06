#!/usr/bin/perl -w
#===============================================================================
#
#         FILE:  some-example6.pl
#
#        USAGE:  ./some-example6.pl
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


#Разбираюсь в regex chapter 9

# Если оператор поиска m// напоминает функцию поиска в текстовом редакторе,
# то оператор замены Perl s/// может рассматриваться как анаQ лог функции поиска с заменой.
# Оператор просто заменяет часть значения переменной 1 , которая совпала с шаблоном,
# заданной строкой:

# Оператор s/// возвращает полезный логический признак; если замена была выполнена успешно,
# возвращается true, а в случае неудачи возвращается false:
$_ = "fred flintstone";
if (s/fred/wilma/) {
    print "Successfully replaced fred with wilma!\n";
}
say $_;


$_ = "He's out bowling with Barney tonight.";
say $_;
s/Barney/Fred/;  # Заменить Barney на Fred
print "$_\n";

# Конечно, и шаблон, и замена могут быть более сложными.
# В данном примере строка замены использует первую
# нумерованную переменQ ную $1, которая задается
# при поиске совпадения:

s/with (\w+)/against $1's team/;
print "$_\n";

$_ = "huge dinosaur";
s/\w+$/($`!)$&/;        # "huge (huge !)dinosaur"
s/\s+(!\W+)/$1 /;       # "huge (huge!) dinosaur"
say $_;




# Модификатор /g требует, чтобы оператор s/// выполнял все возможные неперекрывающиеся замены:

$_ = "home, sweet home!";
say $_;
s/home/cave/g;
print "$_\n";  # "cave, sweet cave!"


$_ = "home, sweet home!";
say $_;
s/home/cave/;
print "$_\n";  # "cave, sweet home!"

# Глобальная замена часто используется для свертки пропусков,
# то есть замены всех серий разных пропусков одним пробелом:
$_ = " Input  data\t may have    extra whitespace. ";
my $i = 1;
print $i++," : "; say "|$_|";
s/\s+/ /g;  # "Input data may have extra whitespace."
print $i++," : "; say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/^\s+//;  # Замена начальных пропусков пустой строкой
print $i++," : "; say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/\s+$//;  # Замена завершающих пропусков пустой строкой
print $i++," : "; say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/^\s+|\s+$//g;  # Удаление начальных и завершающих пропусков
print $i++," : "; say "|$_|";

