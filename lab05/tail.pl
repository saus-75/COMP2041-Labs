#!/usr/bin/perl -w
#@files = ();

if (@ARGV == 0){
    #read from standard input
    @array = <>;
    $arraySize =  0+@array;
    if ($arraySize > 10){
        $cutoff = $arraySize - 10;
        $y = 0;
        while ($y < $arraySize) {
            if ($y < $cutoff){
                $y++;
            }else{
                print $array[$y];
                $y++;
            }
        }
    } else {
        print @array;
    }
    exit(0);
}

foreach $arg (@ARGV) {

    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit(0);
    }
    else {
        push @files, $arg;
    }
}
    $x = 0;
foreach $f (@files) {

    if ($f =~  /^-[0-9]*$/){
        #checks number and deals with pesky dashes
        $x = $f;
        $x =~ s/-//g;
    } else {
        open(F,"<$f") or die "$0: Can't open $f: $!\n";
        @Farr = <F>;
        $FarrSize = 0+@Farr;
        if ($x == 0){
            #default tail
            if ($FarrSize > 10){
                $FarrCutoff = $FarrSize - 10;
                $z = 0;
                if (0+@files > 1){
                    print "==> $f <==\n";
                }
                while ($z < $FarrSize) {
                    if ($z < $FarrCutoff){
                        $z++;
                    } else {
                        print $Farr[$z];
                        $z++;
                    }
                }
            } else {
                if (0+@files > 1){
                    print "==> $f <==\n";
                }   
                print @Farr;
            }
        } else {
            # -n tail
            if ($FarrSize > $x){
                $startCutoff = $FarrSize - $x;
                $z = 0;
                if (0+@files > 1  && 0+@files > 2){
                    print "==> $f <==\n";
                }
                while ($z < $FarrSize) {
                    if ($z < $startCutoff){
                        $z++;
                    } else {
                        print $Farr[$z];
                        $z++;
                    }
                }
            } else {
                if (0+@files > 1  && 0+@files > 2){
                    print "==> $f <==\n";
                } 
                print @Farr;
            }
        }
    }
    close(F);
}