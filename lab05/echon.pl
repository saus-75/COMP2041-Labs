#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 2){
    die "Usage: ./echon.pl <number of lines> <string> at ./echon";
}

$first = $ARGV[0];
$second = $ARGV[1];
$i = 0;

if ($first =~ /^[0-9]*$/){
    while ($i != $first) {
        $i++;
        print "$second\n";
    }
} else {
    die "Usage: ./echon.pl <number of lines> <string> at ./echon";
}