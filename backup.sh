#!/bin/bash

CWD=$(pwd -P)  
echo "You are in" $CWD
DirPath="$(basename $CWD)" 
echo $DirPath
read -p "Do you want to backup the folder above (y/N)? " reply
echo "you typed:" $reply 

if [ "$reply" == "y" ] || [ "$reply" == "Y" ]; then
    TIME=$(date +%b-%d-%y)                    
    FILENAME="backup-$DirPath-$TIME.tar.gz"    
    SRCDIR=$CWD                               
    read -p "Enter the destination folder for backup (default: current directory): " DESDIR
    DESDIR=${DESDIR:-$CWD}                     

    if [ ! -d "$DESDIR" ]; then              
        echo "Error: Destination directory does not exist."
        exit 1
    fi

    echo "Creating backup of $SRCDIR to $DESDIR/$FILENAME..."
    
    tar --exclude="$FILENAME" -zcvf "$DESDIR/$FILENAME" "$SRCDIR"
   
    if [ $? -eq 0 ]; then
        echo "Backup created successfully at $DESDIR/$FILENAME"
    else
        echo "Error occurred during backup."
    fi
else
    echo "Bye..."
fi
