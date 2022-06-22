#! /bin/bash

JSONFILE="/home/pi/Desktop/jq-test/students.json"
README="/home/pi/Desktop/jq-test/README.md"


#echo "Hello" >> "$README"
#jq '.[] | length' "$JSONFILE" get length of each item inside the json array
#jq length "$JSONFILE" get length of the json array

echo "| Roll | Name | Batch | Department |" >> "$README"

git add -A
git commit -m "test"
git push
