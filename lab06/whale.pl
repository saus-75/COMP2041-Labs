#!/usr/bin/perl -w

$in = @ARGV;

if ($in != 1){
    die "Usage: ./whale.pl <whale name> at ./whale.pl\n";
}

$whale = $ARGV[0];

while ($line = <STDIN>) {
    chomp $line;
    @data = split / /, $line, 2;
    $amount = $data[0];
    $name = $data[1];
    $amounts{$name} += "$amount";
    $pods{$name} += 1;
}

$pod = 0;
$total = 0;
$pod = $pods{$whale};
$total = $amounts{$whale};

if (not defined $pod){
    $pod = 0;
    $total = 0;
    print "$whale observations: $pod pods, $total individuals\n";
} else {
    print "$whale observations: $pod pods, $total individuals\n";
}
