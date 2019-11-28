count=0
files=()
for name in `ls *.txt`
do
	files[$count]=$name
	let "count++"
done

if [ $count -eq 0 ]
then
	echo "=========test-error========="
	exit -1
fi

bash ../mvb.sh . txt md
replaced_files=()
count1=0
for name in `ls *.md`
do
	replaced_files[$count1]=$name
	let "count1++"
done

if [ $count -eq 0 ]
then
	echo "=========test-error========="
	exit -1
elif [ $count -ne $count1 ]
then
	echo "=========test-error========="
	exit -1
else
	i=0
	while(( $i<$count ))
	do
		if [ ${files[$i]%.txt} -ne ${replaced_files[$i]%.md} ]
		then
			echo "=========test-error========="
			exit -1
		fi
		let "i++"
	done
fi
echo "=========test-pass========="
bash ../mvb.sh . md txt



