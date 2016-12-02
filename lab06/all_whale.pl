#!/usr/bin/perl -w

while ($line = <STDIN>) {
    chomp $line;
    #convert to lower case
    $line = lc $line;
    #cut of trailing s
    $line =~ s/s$//g;
    #shorted whitespace
    $line =~ s/ +/ /g;
    #trim trailing whitespace
    $line =~ s/\s+$//g;
    #split input
    @data = split / /, $line, 2;   
    $amount = $data[0];
    $name = $data[1];
    $amounts{$name} += "$amount";
    $pods{$name} += 1;
}

foreach $name (sort keys %amounts) {
    $pod = $pods{$name};
    $total = $amounts{$name};
    print "$name observations: $pod pods, $total individuals\n";
}