#!/bin/bash
file=$1

music=`echo "$file"| cut -d '/' -f 1`
folder=`echo "$file"| cut -d '/' -f 2`
cd $music

if test "$#" -gt 1
    then
        for f in *
        do
            year=`echo "$f"| cut -d ',' -f 2| sed 's/ //'`
            album="$f"
            cd "$f"

            for m in *
            do
                track=`echo "$m"| cut -d '-' -f 1| sed 's/ //'`
                title=`echo "$m"| cut -d '-' -f 2| sed 's/ //'`
                artist=`echo "$m"| cut -d '-' -f 3 | cut -d '.' -f 1| sed 's/ //'`
                id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$m" >/dev/null
            done
            cd ..
        done
elif test "$#" -eq 1
    then
        year1=`echo "$folder"| cut -d ',' -f 2| sed 's/ //'`
        album1="$folder"
    cd "$folder"
    for d in *
        do
            track1=`echo "$d"| cut -d '-' -f 1| sed 's/ //'`
            title1=`echo "$d"| cut -d '-' -f 2| sed 's/ //'`
            artist1=`echo "$d"| cut -d '-' -f 3 | cut -d '.' -f 1| sed 's/ //'`
            id3 -t "$title1" -T "$track1" -a "$artist1" -A "$album1" -y "$year1" "$d" >/dev/null
        done
fi
exit

# to fix the extra weird file name, reverse string and remove .mp3 then reverse it back

