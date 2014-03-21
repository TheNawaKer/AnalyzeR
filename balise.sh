#!/bin/bash
cpt=0
i=0
for w in $(ls $1)
do
	echo "$w"
	for v in $(ls $1$w)
	do
	    var="$var$(cat $1$w/$v | tr [A-Z] [a-z] | grep -o -E "</[^>]*>" | sed -e "s/<\/\(.*\)>/\1/g" |sort -u)"

	    # do
	    # 	#balise[$b]=$((balise[$b]+1))
	    # 	grep -o -i "$b>" $1$w/$v | wc -l
	    # done
	done
	echo $var | sort -u
	#echo "moyenne=$(($i/$cpt))"
done

