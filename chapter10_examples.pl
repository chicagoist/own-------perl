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


