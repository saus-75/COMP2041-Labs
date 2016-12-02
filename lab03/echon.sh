#!/bin/sh/

if test $# -ne 2
then
    echo 'Usage: echon.sh [number of lines] [string]'
    exit 1
fi

number=$1
string=$2

numberTest=`echo $number|egrep "^[0-9]*$"|wc -w`

if test $numberTest -eq 0
then
    echo 'argument 1 must be a non-negative integer'
    exit 1
fi

if test $1 -lt 0
then
    echo 'argument 1 must be a non-negative integer'
    exit 1
fi

i=0

while test $i -lt $number
    do
        echo $2
        i=`expr $i + 1`
    done
exit 0

