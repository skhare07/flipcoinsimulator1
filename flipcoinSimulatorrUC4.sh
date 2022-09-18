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
c2=$(( RANDOM%2 ))
if [[ $isHead -eq $c && $isHead -eq $c1 && $isHead -eq $c2 ]]
then
#	echo "head head head"
	(( h++ ))
	(( h++ ))
	(( h++ ))
dictionary[$i]=HHH

elif [[ $isHead -eq $c && $isHead -eq $c1 && $isTail -eq $c2 ]]
then
#	echo " head head tail"
	(( h++ ))
	(( h++ ))
	(( t++ ))
	dictionary[$i]=HHT


elif [[ $isHead -eq $c && $isTail -eq $c1 && $isHead -eq $c2 ]]
then
#	echo " head tail head "
	(( h++ ))
	(( t++ ))
	(( h++ ))
	dictionary[$i]=HTH

elif [[ $isTail -eq $c && $isHead -eq $c1 && $isHead -eq $c2 ]]
then
#	echo " tail head head "
	(( t++ ))
	(( h++ ))
	(( h++ ))
	dictionary[$i]=THH

elif [[ $isTail -eq $c && $isTail -eq $c1 && $isHead -eq $c2 ]]
then
#	echo "tail tail head"
	(( t++ ))
	(( t++ ))
	(( h++ ))
	dictionary[$i]=TTH

elif [[ $isTail -eq $c && $isHead -eq $c1 && $isTail -eq $c2 ]]
then
#	echo "tail head tail"
	(( t++ ))
	(( h++ ))
	(( t++ ))
	dictionary[$i]=THT

elif [[ $isHead -eq $c && $isTail -eq $c1 && $isTail -eq $c2 ]]
then
#	echo "head tail tail"
	(( h++ ))
	(( t++ ))
	(( t++ ))
	dictionary[$i]=HTT
else
#	echo "tail tail tail"
	(( t++ ))
	(( t++ ))
	(( t++ ))
	dictionary[$i]=TTT


fi

done

echo "Head : " $h
echo "Tail : " $t
echo "Triplet : ${dictionary[@]}"


percentHead=`echo "scale=2;" " $h / $f * 100 / 3 " | bc`
echo "Winning percent of head : " $percentHead

percentTail=`echo "scale=2;"  " 100 - $percentHead " | bc `
echo "Winning percent of tail : " $percentTail
