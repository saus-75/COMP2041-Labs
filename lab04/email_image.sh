#!/bin/bash

if test $# -lt 1
then
    echo 'Usage: email_image.sh [file name]'
    exit 1
fi

for f in "$@"
do
    display "$f"
    echo 'Address to e-mail this image to?'
    read email
    echo 'Message to accompany image?'
    read message
    echo "$@ sent to $email"
    `echo "$message" | mutt -a "$f" -- "$email"`
done
