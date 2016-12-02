#!/usr/bin/perl -w

$in = @ARGV;
$pos = 0;

if ($in < 1){
    die "Usage: ./lecture0.pl <course> at ./lecture0.pl\n";
} 

foreach $code (@ARGV){
    $url = "http://timetable.unsw.edu.au/current/$code".".html";
    $lecture = 0;
    open U, "wget -q -O- $url|";

    if (U ne " "){
        $semester = "S1";
        while ($line = <U>){
            if ($line =~ m/<a href=\"#S1\"/ig){
                $semester = S1;
            }
            if ($line =~ m/<a href=\"#S2\"/ig){
                $semester = S2;
            }
            if ($line =~ m/<a href=\"#X1\"/ig){
                $semester = X1;
            }
            if ($line =~ m/.*>Lecture<\/a>/ig){
                $lecture = 1;
            }
            if ($line =~ m/.*>WEB<\/a>/ig){
                $lecture = 0;
            }
            if ($line =~ m/<td .*>(Mon|Tue|Wed|Thu|Fri).+<\/td>/ig && $lecture == 1){
                $line =~ s/<\/td>//g;
                $line =~ s/.*\>//g;
                $courses{"$code: $semester $line"} = $pos;
                $lecture = 0;
                $pos++;
            }
        }
    }
}

foreach $name (sort { $courses{$a} <=> $courses{$b} } keys %courses) {
    print "$name";
}