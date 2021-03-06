#! /bin/bash

JSON="/home/pi/Desktop/jq-test/repo.json"

FORMAT=`cat "$JSON" | jq '[.[] | {Name: .commit.author.name, Message: .commit.message, Compare_Log: .sha, CommitLink: .html_url}]'`

echo $FORMAT | jq '.'
LENGTH=`echo "$FORMAT" | jq length`
echo "| User | Message | Changes |" >> /home/pi/Desktop/jq-test/README.md
echo "| ---- | ----------- | ---- |" >> /home/pi/Desktop/jq-test/README.md
str=""


for(( i=0; i<$LENGTH; i++ ))
do
    str+="| "
    str+=`echo $FORMAT | jq -r ".[$i].Name"`
    str+=" | "
    str+=`echo $FORMAT | jq -r ".[$i].Message"`
    str+=" | "
    str+="["
    str+=`echo $FORMAT | jq -r ".[$i].Compare_Log[0:6]"`
    str+="]"
    str+="("
    str+=`echo $FORMAT | jq -r ".[$i].CommitLink"`
    str+=")"
    str+=" |"
    echo $str >> /home/pi/Desktop/jq-test/README.md
    str=""
done

git add -A
git commit -m "push new table"
git push

