#!/usr/bin/perl -w

# use 5.10.0;
#use CGI;
#use POSIX;
# use Encode qw(decode_utf8);
# use Encode qw(decode encode);
# BEGIN{@ARGV=map Encode::decode($_,1),@ARGV;}
# BEGIN{@ARGV = map decode_utf8($_, 1), @ARGV;}
# use open qw(:std :encoding(UTF-8));
# use utf8::all 'GLOBAL';
# use Encode::Locale;
# use Encode;


use strict;
use warnings FATAL => 'all';
use diagnostics;
use utf8;
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');


# УПРАВЛЯЮЩАЯ КОНСТРУКЦИЯ unless

# В управляющей конструкции if  блок кода выполняется только в том случае, если условие истинно.
# Если блок кода должен выполняться только при ложном условии, замените if на unless:
my $fred = "007Fred";
unless ($fred =~ /^[A-Z_]\w*$/i) {
    print "The value of \$fred doesn't look like a Perl identifier name.\n";
}
# В сущности, конструкция unless эквивалентна проверке if с противоположным условием.
# Также можно сказать, что unless напоминает самостоятельную секцию else.
if ($fred =~ /^[A-Z_]\w*$/i) {
    # Ничего не делать
} else {
    print "The value of \$fred doesn't look like a Perl identifier name.\n";
}

# СЕКЦИЯ else в unless

# Конструкция unless  даже может содержать необязательную секцию else.
# Этот синтаксис поддерживается, но он может привести к потенциальным недоразумениям:
my $mon = "December";
unless ($mon =~ /^Feb/) {
    print "This month has at least thirty days.\n";
} else {
    print "Do you see what's going on here?\n";
}
# Но мы предпочитаем лиQ бо использовать if  с отрицанием условия, либо просто переставить
# секции для получения обычной конструкции if:
if ($mon =~ /^Feb/) {
    print "Do you see what's going on here?\n";
}
else {
    print "This month has at least thirty days.\n";
}

# УПРАВЛЯЮЩАЯ КОНСТРУКЦИЯ until
# Иногда бывает удобнее выполнить цикл while  с обратным условием.
# Для этого воспользуйтесь конструкцией until:
my($j, $i) = (1, 10);
 until ($j > $i) {
     $j *= 2;
     say $j;
 }
# until - Пока не станет так ($j > $i)
# Цикл выполняется до тех пор, пока выражение в условии не вернет true.

# МОДИФИКАТОРЫ ВЫРАЖЕНИЙ
# Чтобы сделать запись более компактной, после выражения может следовать
# управляющий модификатор.:
my $x1 = -10;
my $x2 = 10;
my $random = int( rand($x1 - $x2+1)) + $x2;
 print "$random is a negative number.\n" if $random < 0; # Например, модификатор if  работает по аналогии с блоком if

# Результат получается точно таким же, как при использовании следующего кода :
if ($random < 0) {
    print "$random is a negative number.\n";
}

# Существуют и другие модификаторы:
# &error("Invalid input") unless &valid($input);
# $i *= 2 until $i > $j; print " ", ($n += 2) while $n < 10;
# &greet($_) foreach @person;

my ($fred1, $barney, $I_am_curious) = ("Fred", "Barney", "YES");
# В одном из стандартных способов применения этих модификаторов используются
# команды следующего вида:
 print "fred is '$fred1', barney is '$barney'\n"          if $I_am_curious;
# При подобной «инвертированной» записи наиболее важная часть команды записывается в начале.

