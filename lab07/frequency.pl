#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 1){
    die "Usage: ./frequency.pl <word> at ./frequency.pl\n";
}

$key = $ARGV[0];

foreach $file (glob "poems/*.txt"){

    open(F,"<$file");

    undef @line;
    undef @indiWords;
    $total_sum = 0;
    $spec_sum = 0;

    while ($text = <F>){
        chomp $text;
        push @line,$text;
    }

    #gets rid of poems/
    $file =~ s/poems\///g;
    $file =~ s/_/ /g;
    $file =~ s/.txt//g;

    foreach $para (@line) {
        @indiWords = split /[^a-zA-Z]/, $para;
        foreach $word (@indiWords){
            if ($word =~ /[a-zA-Z]/){
                if ($word =~ /^$key$/i){
                    $spec_sum++;
                }
                $total_sum++;
            }
        }
        $total_words{$file} = "$total_sum";
        $spec_words{$file} = "$spec_sum";
    }

}


foreach $file (sort keys %total_words) {
    $total_word = $total_words{$file};
    $spec_word = $spec_words{$file};

    $spec_word = sprintf "%4d", $spec_word;
    $total_word = sprintf "%6d", $total_word;
    $freq = sprintf "%.9f", $spec_word/$total_word;
    print "$spec_word/$total_word = $freq $file\n";
}









