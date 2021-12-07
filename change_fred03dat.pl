#!/usr/bin/perl

use 5.10.0;
use strict;
use warnings FATAL => 'all';
use diagnostics;
use open qw(:std :encoding(UTF-8));
use Encode qw(decode_utf8);
#BEGIN{@ARGV = map decode_utf8($_, 1),@ARGV;}
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
use utf8::all 'GLOBAL';
use Encode::Locale;
#use CGI;
#use POSIX;
#use utf8;

# Updating Many Files

# Обновление нескольких файлов
# В следующем примере используются сотни файлов, имеющих похоQ жий формат.
# Один из них, fred03.dat, содержит строки следующего вида:
#
#    Program name: granite
#    Author: Gilbert Bates
#    Company: RockSoft
#    Department: R&D
#    Phone: +1 503 555-0095
#    Date: Tues March 9, 2004
#    Version: 2.1
#    Size: 21k
#    Status: Final beta

# Требуется обновить файл и включить в него другую информацию. ПоQсле обновления файл должен выглядеть примерно так:
#
#    Program name: granite
#    Author: Randal L. Schwartz
#    Company: RockSoft
#    Department: R&D
#    Date: December 15, 2021 6:38 pm
#    Version: 2.1
#    Size: 21k Status:
#    Final beta
#
chomp(@_);
chomp(my $date = `date`);
$^I = ".bak";  # $^I The current value of the inplace-edit extension. Use undef to disable inplace editing.
#  Mnemonic: value of -i switch.
while (<>) {
    s/^#\s*//g;
    s/\bAuthor:.*/Author: Randal L. Schwartz/;
    s/\bPhone:.*\n//;
    s/\bDate:.*/Date: $date/;
    print;
}





