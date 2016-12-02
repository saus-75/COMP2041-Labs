#!/bin/bash

if test $# -ne 1
then
    echo 'Usage: date_image.sh [file name]'
    exit 1
fi

name=$1
temp=temp

date=`ls -l|egrep $name|cat|cut -c 35-47`

`cp -p $name $temp`
`convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" $name $name`
`touch -r $temp $name`
`rm $temp`
exit 