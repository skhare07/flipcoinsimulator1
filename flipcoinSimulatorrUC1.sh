#!/bin/bash

isHead=1;


c=$(( RANDOM%2 ))

if [ $isHead -eq $c ]
then
	echo "head"
else
	echo "tail"
fi


