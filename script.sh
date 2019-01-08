#!/bin/bash

ls /home/ss/SQLscript | grep .sql | sort -V | grep '^[0-9]' | tr -d [:alpha:] | tr -d '.'| tee /home/ss/filenumber.txt

filenumber="/home/ss/filenumber.txt"
while IFS= read -r line
do
versionid=$(sqlite3 /home/ss/test.db "SELECT * FROM versiontable")
if [ $versionid -lt $line ]
then
sqlite3 /home/ss/test.db "UPDATE versiontable SET versionid = $line"
fi
done <"$filenumber"





