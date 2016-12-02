#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 1){
    die "Usage: ./prereq.pl <course name> at ./prereq.pl\n";
}
$course = $ARGV[0];

$UGurl = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$course.html";
$PGurl = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$course.html";

open U, "wget -q -O- $UGurl|";
open P, "wget -q -O- $PGurl|";

if (U ne ""){
    while ($line = <U>){
        if ($line =~ /<p>Pre.*?<\/p>/i){
            # HTML tage removal
            $line =~ s/<.+?>//g;
            # &nbsp; removal
            $line =~ s/&nbsp;/ /g;
            # break removal
            $line =~ s/\n//g;
            # fullstop and everything after that removal
            $line =~ s/\..+//g;
            # special excluded removal
            $line =~ s/excluded.*//ig;
            # special CSS contribution removal
            $line =~ s/CSS.*//ig;
            # pre/prereq/prerequiste removal
            $line =~ s/pre[^:]*://ig;
            # or into break
            $line =~ s/or/\n/g;
            # and into break
            $line =~ s/and/\n/g;
            # removal of extra comments
            $line =~ s/[a-z]//g;
            # remobal of extra numbers
            $line =~ s/\s[0-9]+//g;
            # whitespace removal
            $line =~ s/[ \t\r\f]//g;
            # comma removal
            $line =~ s/,//g;
            print "$line \n";
        }
    }
}

if (P ne ""){
    while ($line = <P>){
        if ($line =~ /<p>Pre.*?<\/p>/i){
            # HTML tage removal
            $line =~ s/<.+?>//g;
            # &nbsp; removal
            $line =~ s/&nbsp;/ /g;
            # break removal
            $line =~ s/\n//g;
            # fullstop and everything after that removal
            $line =~ s/\..+//g;
            # special excluded removal
            $line =~ s/excluded.*//ig;
            # pre/prereq/prerequiste removal
            $line =~ s/pre[^:]*://ig;
            # or into break
            $line =~ s/or/\n/g;
            # and into break
            $line =~ s/and/\n/g;
            # removal of extra comments
            $line =~ s/[a-z]//g;
            # remobal of extra numbers
            $line =~ s/\s[0-9]+//g;
            # whitespace removal
            $line =~ s/[ \t\r\f]//g;
            # comma removal
            $line =~ s/,//g;
            print "$line \n";
        }
    }
}

#Instead of removal try pattern capturing
