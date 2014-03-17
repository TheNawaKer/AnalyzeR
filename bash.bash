#!/bin/bash
cpt=0
i=0
for w in $(ls $1)
do
	echo "$w"
	for v in $(ls $1$w)
	do
	    cpt=$((cpt+1))
	    j=$(cat $1$w/$v | tr [A-Z] [a-z] | tr "\n" " " | tr "\r" " " | sed s/"<script.*<\/script>"/" "/g | sed s/"<[^>]*>"/" "/g | sed "s/[ \t][ \t]*/\ /g" | wc -w)
	    i=$(( i+j))
	done
	echo $i
	echo "moyenne=$(($i/$cpt))"
done
