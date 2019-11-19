#!/bin/sh

getdate() {
	bname=$(basename "$1")
	datestr=$(echo "$bname" | cut -d '-' -f 1-3)
	date -d $datestr +'%Y %b %d'
}


gettitle() {
	head -n 1 "$1" | sed -e 's/<[^>]*>//g'
}


getlistitem() {
	datestr=$(getdate "$f")
	title=$(gettitle "$f")
	echo "<li>$datestr &ndash; <a href=\"$f\">$title</a></li>"
}


progname=$(basename "$0")

if [ $# -gt 1 ]; then
	echo "usage: $progname [numfiles]" 1>&2
	exit 1
fi

echo "<ul>"
FILES=$(find posts -name "*.html" | sort -r)

if [ $# -eq 1 ]; then
	FILES=$(echo "$FILES" | head -n $1)
fi

for f in $FILES
do
	getlistitem "$f"
done
echo "</ul>"
