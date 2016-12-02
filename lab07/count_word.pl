#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 1){
    die "Usage: ./count_word.pl <word> at ./count_word.pl\n";
}

$key = $ARGV[0];

@line = ();
$sum = 0;

while ($text = <STDIN>){
    chomp $text;
    push @line,$text;
}

@indiWords = ();

foreach $para (@line) {
    @indiWords = split /[^a-zA-Z]/, $para;
    foreach $word (@indiWords){
        if ($word =~ /^$key$/i){
            $sum++;
        }
    }
}
print "$key occurred $sum times\n"
