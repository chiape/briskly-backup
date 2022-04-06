#!/bin/bash

CWD=$(pwd -P)

echo "You are in" $CWD

DirPath="$(basename $CWD)"
echo $DirPath
read -p "Do you want to backup the folder above (y/N)?" reply

echo "you typed" : $reply 

if [ $reply == "y" ] || [ $reply == "Y" ]; then


TIME=`date +%b-%d-%y`                         # This Command will read the date.
FILENAME=backup-$DirPath-$TIME.tar.gz         # The filename including the date.
SRCDIR=$CWD                                   # Source backup folder.
DESDIR=$CWD                                   # Destination of backup file.
touch $FILENAME                               # Create file to avoid warning of file changes.
tar --exclude=$FILENAME -zcvf $DESDIR/$FILENAME $SRCDIR
else
echo " bye..."
fi 
