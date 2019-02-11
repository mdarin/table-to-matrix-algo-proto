#!/usr/bin/perl -w
use warnings;
use strict;

my $fin;
my $fout;
open $fin, "<./tickers.csv";
open $fout, ">./table.mat";

my $sep = ",";

my %tab;
my $lineno = 0;
grep { chomp;
	if (!$lineno) {
	# skip header
		$lineno++;
	} else {
	# read data
		$lineno++;
		my @rec = split $sep, $_;
		#print $rec[0] . ";" . $rec[6] . "\n"; # TIKER;CLOSE
		unless (exists $tab{$rec[0]}) {
		# create array no first time and fill it in
			#print "CREATE " . $rec[0] . "\n";
			$tab{$rec[0]} = [()];
			push @{$tab{$rec[0]}}, $rec[6];
		} else {
		# fill in an array
			#print "INSERT " . $rec[0] . "\n";
			push @{$tab{$rec[0]}}, $rec[6];
			#print "len:" . @{$tab{$rec[0]}} . "\n";
		}
	}
} <$fin>;
# get the longest array(max length)
my $max_len = 0;
while (my ($key,$value) = each %tab) {
	if ($max_len < @{$value}) {
		$max_len = @{$value};
	}
	#print ">> $key , value len: " . @{$value} . "\n";
}
print "max len: $max_len\n";


# print haead with ticker names
my $separator = "";
while (my ($key,$value) = each %tab) {
	print "$separator$key";
	$separator = ";";
}
print "\n";

# traverse table and clreate matrix ntickers x max_len
# make addition to zero for empty field of tickers that shorter than the longest length
foreach my $i (1..$max_len-1) {
    #print "iteration $i ";
	my $separator = "";
	while (my ($key,$value) = each %tab) {
		if (defined($value->[$i])) {
			print $separator . $value->[$i];
		} else {
		# addition to zero for empty fields
			print $separator . "0.0";
		}
		$separator = ";";
	}
	print "\n";
}

close $fin;
close $fout;

