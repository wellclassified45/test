#!./perl -w

no strict;

BEGIN {
    if ($ENV{PERL_CORE}) {
	@INC = '../lib';
	chdir 't';
    }
}

use Getopt::Long qw(:config no_ignore_case);
my $want_version="2.24";
die("Getopt::Long version $want_version required--this is only version ".
    $Getopt::Long::VERSION)
  unless $Getopt::Long::VERSION ge $want_version;

print "1..9\n";

@ARGV = qw(-Foo -baR --foo bar);
undef $opt_baR;
undef $opt_bar;
print "ok 1\n" if GetOptions ("foo", "Foo=s");
print ((defined $opt_foo)   ? "" : "not ", "ok 2\n");
print (($opt_foo == 1)      ? "" : "not ", "ok 3\n");
print ((defined $opt_Foo)   ? "" : "not ", "ok 4\n");
print (($opt_Foo eq "-baR") ? "" : "not ", "ok 5\n");
print ((@ARGV == 1)         ? "" : "not ", "ok 6\n");
print (($ARGV[0] eq "bar")  ? "" : "not ", "ok 7\n");
print (!(defined $opt_baR)  ? "" : "not ", "ok 8\n");
print (!(defined $opt_bar)  ? "" : "not ", "ok 9\n");
