#!/usr/bin/perl -w

@line = ();
$sum = 0;

while ($text = <STDIN>){
    #gets rid of \n
    chomp $text;
    #push each line into an array
    push @line,$text;
}

@indiWords = ();

foreach $para (@line) {
    #split anything that isn't an alphabets
    @indiWords = split /[^a-zA-Z]/, $para;
    #loop through and count the amount of words
    foreach $word (@indiWords){
        #another checker to make sure that 
        #empty strings are not counted
        if ($word =~ /[a-zA-Z]/){
            $sum++;
        }
    }
}
print "$sum words\n"
