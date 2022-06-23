#! /bin/bash

JSONFILE="/home/pi/Desktop/jq-test/students.json"
README="/home/pi/Desktop/jq-test/README.md"


#echo "Hello" >> "$README"
#jq '.[] | length' "$JSONFILE" get length of each item inside the json array
#jq length "$JSONFILE" get length of the json array

echo "| Roll | Name | Batch | Department |" >> "$README"
echo "| --- | --- | --- | --- |" >> "$README"
#echo "| test | test | test | test |" >> "$README"

LENGTH=`jq length "$JSONFILE"`
#jq '.[0].roll' "$JSONFILE"

str=""
for (( i=0; i<$LENGTH; i++ ))

do
    echo "i = ${i}"
    str+="| "    
    str+=`jq ".[$i].roll" "$JSONFILE"`
    str+=" | "
    str+=`jq ".[$i].name" "$JSONFILE"`
    str+=" | "
    str+=`jq ".[$i].batch" "$JSONFILE"`
    str+=" | "
    str+=`jq ".[$i].department" "$JSONFILE"`
    str+=" |"
    echo "At end ${i}"
    echo $str >> "$README"
    str=""
done


git add -A
git commit -m "test"
git push
