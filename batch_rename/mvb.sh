#!/bin/bash
if [ $# != 3 ]
then
	echo "usage: mvb directory source target
       bash mvb.sh . jpg jpeg"
	exit -1
fi
for name in `ls $1/*.$2`
do
	echo "$name -> ${name%.$2}.$3"
	mv $name ${name%.$2}.$3
done

