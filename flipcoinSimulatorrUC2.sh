#!/bin/bash

isHead=1;
h=0;
t=0;
declare -A dictionary

read -p " Enter no of flips : " f

for (( i=1 ; i<=$f ; i++ ))
do
c=$(( RANDOM%2 ))

if [ $isHead -eq $c ]
then
#	echo "head"
	(( h++ ))
	dictionary[$i]=H

else
#	echo "tail"
	(( t++ ))
	dictionary[$i]=T
fi

done

echo "Head : " $h
echo "Tail : " $t
echo "Singlets : ${dictionary[@]}"


percentHead=`echo "scale=2;" " $h / $f * 100 " | bc`
echo "Winning percent of head : " $percentHead

percentTail=`echo "scale=2;"  " 100 - $percentHead " | bc `
echo "Winning percent of tail : " $percentTail
