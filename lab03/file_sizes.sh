#!/bin/sh/
#set -x
smol="Small files: "
mid="Medium-sized files: "
swol="Large files: "

for f in *
do
    if test `cat $f|wc -l` -lt 10
    then
        smol=`echo $smol $f`
    elif test `cat $f|wc -l` -ge 10 -a `cat $f|wc -l` -lt 100
    then 
        mid=`echo $mid $f`
    else 
        swol=`echo $swol $f`
    fi
done
echo $smol
echo $mid
echo $swol
exit
