#!/bin/bash

isHead=1;
isTail=0;

h=0;
t=0;


declare -A dictionary

read -p " Enter no of flips : " f

for (( i=1 ; i<=$f ; i++ ))
do
c=$(( RANDOM%2 ))
c1=$(( RANDOM%2 ))
if [[ $isHead -eq $c && $isHead -eq $c1 ]]
then
#	echo "head head"
	(( h++ ))
	(( h++ ))
	dictionary[$i]=HH

elif [[ $isHead -eq $c && $isTail -eq $c1 ]]
then
#	echo " head tail"
	(( h++ ))
	(( t++ ))
	dictionary[$i]=HT


elif [[ $isTail -eq $c && $isHead -eq $c1 ]]
then
#	echo " tail head "
	(( t++ ))
	(( h++ ))
	dictionary[$i]=TH


else
#	echo " tail tail "
	(( t++ ))
	(( t++ ))
	dictionary[$i]=TT


fi

done

echo "Head : " $h
echo "Tail : " $t
echo "Doublet : ${dictionary[@]}"


percentHead=`echo "scale=2;" " $h / $f * 50 " | bc`
echo "Winning percent of head : " $percentHead

percentTail=`echo "scale=2;"  " 100 - $percentHead " | bc `
echo "Winning percent of tail : " $percentTail
