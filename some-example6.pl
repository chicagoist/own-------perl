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
s/Barney/Fred/; # Заменить Barney на Fred
print "$_\n";

# Конечно, и шаблон, и замена могут быть более сложными.
# В данном примере строка замены использует первую
# нумерованную переменQ ную $1, которая задается
# при поиске совпадения:

s/with (\w+)/against $1's team/;
print "$_\n";

$_ = "huge dinosaur";
s/\w+$/($`!)$&/;  # "huge (huge !)dinosaur"
s/\s+(!\W+)/$1 /; # "huge (huge!) dinosaur"
say $_;


# Модификатор /g требует, чтобы оператор s/// выполнял все возможные неперекрывающиеся замены:

$_ = "home, sweet home!";
say $_;
s/home/cave/g;
print "$_\n"; # "cave, sweet cave!"


$_ = "home, sweet home!";
say $_;
s/home/cave/;
print "$_\n"; # "cave, sweet home!"

# Глобальная замена часто используется для свертки пропусков,
# то есть замены всех серий разных пропусков одним пробелом:
$_ = " Input  data\t may have    extra whitespace. ";
my $i = 1;
print $i++, " : ";
say "|$_|";
s/\s+/ /g; # "Input data may have extra whitespace."
print $i++, " : ";
say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/^\s+//; # Замена начальных пропусков пустой строкой
print $i++, " : ";
say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/\s+$//; # Замена завершающих пропусков пустой строкой
print $i++, " : ";
say "|$_|";

$_ = " Input  data\t may have    extra whitespace. ";
s/^\s+|\s+$//g; # Удаление начальных и завершающих пропусков
print $i++, " : ";
say "|$_|";

my $file_name = "/usr/share/perl";
say '/usr/share/perl = ', $file_name;
$file_name =~ s#\A.*/##s; # In $file_name, remove any Unix-style path
say '/usr/share/perl = ', $file_name;


#Комбинация \U  преобразует все последующие символы к верхнему регистру:
$_ = "I saw Barney with Fred and Wilma.";
say $_;
s/(fred|barney)/\U$1/gi; # $_ теперь содержит "I saw BARNEY with FRED."
say $_;

#Аналогичная комбинация \L обеспечивает преобразование к нижнему регистру. Продолжение предыдущего фрагмента:
s/(fReD|bArNey)/\L$1/gi; # $_ теперь содержит "I saw barney with fred."
say $_;

# По умолчанию преобразование распространяется на остаток (заменяюQ щей) строки; также можно вручную отменить
# переключение регистра комбинацией \E:
s/(\w+) with (\w+)/\U$2\E with $1/i; # $_ содержит "I saw FRED with barney."
say $_;

#При записи в нижнем регистре (\l и \u) эти комбинации влияют тольQ ко на следующий символ:
s/(fred|barney)/\u$1/ig; # $_ теперь содержит "I saw FRED with Barney."
say $_;

# Они даже могут использоваться в сочетании друг с другом. Например, объединение \u с \L
# означает: «все в нижнем регистре, но первая буква в верхнем регистре»:
s/(fred|barney)/\u\L$1/ig; # $_ теперь содержит "I saw Fred with Barney."
say $_;
$_ = undef;

my $name = "VALERII";
# so work too
print "Hello, \L\u$name\E, would you like to play a game?\n"; # Hello, Valerii, would you like to play a game?

my @fields = split /:/, ":::a:b:c:::"; # Получаем ("", "", "", "a", "b", "c")
foreach (@fields) {
    say ">$_<";
}

$_ = ":::a:b:c:::";
#По умолчанию split разбивает $_ по пропускам:
@fields = split; # Эквивалентно split /\s+/, $_;
foreach (@fields) {
    say ">$_<";
}
# :::a:b:c:::


my $x = join ":", 4, 6, 8, 10, 12; # $x содержит "4:6:8:10:12"
say ">$x<";

# Используя переменную $x  из предыдущего примера, мы можем разQ бить строку
#     и собрать ее заново с другим разделителем:
my @values = split /:/, $x; # @values содержит (4, 6, 8, 10, 12)
foreach my $str (@values) {
    say ">$str<";
}
my $z = join "-", @values; # $z содержит "4-6-8-10-12"
say $z;
# Хотя split и join хорошо работают в сочетании друг с другом, не забывайте,
# что первый аргумент join всегда содержит строку, а не шаблон.

# When a pattern match (m//) is used in a list context, the return value is a list
# of the capture variables created in the match, or an empty list if the match failed:
$_ = "Hello there, neighbor!";
my ($first, $second, $third) = /(\S+) (\S+), (\S+)/;
print "$second is my $third\n";

# Модификатор /g, впервые встретившийся нам при описании s///, раQ ботает и с m//;
# он позволяет найти совпадение в нескольких местах строки. В этом случае шаблон с
# парой круглых скобок будет возвраQ щать элемент списка для каждого найденного совпадения:
my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
my @words = ($text =~ /([a-z]+)/ig);
print "Result: @words\n"; # Result: Fred dropped a ton granite block on Mr Slate


# Если шаблон содержит несколько пар круглых скобок, для каждого совпадения может
# возвращаться более одной строки. Предположим, у нас имеется строка, которую
# необходимо прочитать в хеш:
my $data = "Barney Rubble Fred Flintstone Wilma Flintstone";
my %last_name = ($data =~ /(\w+)\s+(\w+)/g);
foreach (keys %last_name) {
    print "Name Surname: $_ $last_name{$_}\n";
}

# Greedy Quantifiers
# Допустим, у нас имеется HTML-подобный текст, из которого необходимо  удалить все теги  <BOLD> и </BOLD>
my $data1 = "I thought you said Fred and  <BOLD>Velma</BOLD>, not  <BOLD>Wilma</BOLD>";
$data1 =~ s#(<BOLD>(.*)</BOLD>)#$2#g; # typo in translated book at page 177
say ">$data1<";                       # >I thought you said Fred and  Velma</BOLD>, not  <BOLD>Wilma<

# Нежадные квантификаторы
$data1 = "I thought you said Fred and  <BOLD>Velma</BOLD>, not  <BOLD>Wilma</BOLD>";
$data1 =~ s#(<BOLD>(.*?)</BOLD>)#$2#g; # typo in translated book at page 177
say ">$data1<";                        # >I thought you said Fred and  Velma, not  Wilma<

