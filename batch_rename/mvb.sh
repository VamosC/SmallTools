#!/bin/bash
if [ $# != 2 ]
then
	echo "usage: mvb source target
       bash mvb.sh jpg jpeg"
	exit -1
fi
for name in `ls *.$1`
do
	echo "$name -> ${name%.$1}.$2"
	mv $name ${name%.$1}.$2
done

