#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 1){
    die "Usage: ./courses.pl <course> at ./courses.pl\n";
}

$code = $ARGV[0];

$url = "http://www.timetable.unsw.edu.au/current/$code"."KENS.html";

open U, "wget -q -O- $url|";

if (U ne " "){
    while ($line = <U>){
        if ($line =~ /\>$code/i){
            $line =~ s/<\/a>.*//g;
            $line =~ s/.*\>//g;
            print $line;
        }
    }
}
