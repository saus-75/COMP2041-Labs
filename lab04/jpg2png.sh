#!/bin/bash

for f in *
do
    if test `echo $f|egrep "$f\.png"|wc -w` -lt 1
    then 
        f=`echo $f|cat|cut -d '.' -f 1`
        convert "$f.jpg" "$f.png"
        rm "$f.jpg"
    else
       echo "File Exist"
       exit;
    fi
done