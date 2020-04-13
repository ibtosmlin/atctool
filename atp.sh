#!/bin/bash
# arguments
arg1=${1}
arg2=${2}
# settings
urlcontest='https://atcoder.jp'
cp=$(pwd)
pp=$(dirname $cp)

faname=$arg1
conid=`echo $arg1 | sed -e 's/_.*$//g'`
taskid="${faname%.*}"
langid="${faname##*.}"
url="${urlcontest}/contests/${conid}/tasks/${taskid}/"

if [ $arg2 = 'd' ]; then
    mkdir -p $taskid
    cd $taskid
    oj d $url
    cd ..
    x-www-browser $url
    fm="$pp/templates/main.$langid"
    to="$cp/$faname"
    cp $fm $to
    echo "$faname created in $to"
    code $to

elif [ $arg2 = 't' ]; then
    fm="$cp/$faname"
    to="$cp/$taskid/main.$langid"
    cp $fm $to
    echo "main.$langid created in $to"
    cd $taskid
    if [ $langid = 'py' ]; then
        oj t -c 'python3 main.py' -S
    else
        echo '対応していません'
    fi
    cd ..


elif [ $arg2 = 's' ]; then
    echo 's'
# copy
    fm="$cp/$faname"
    to="$cp/$taskid/main.$langid"
    cp $fm $to
    echo "main.$langid created in $to"
    cd $taskid
    echo y | oj s $url "main.$langid"
    cd ..

elif [ $arg2 = 'z' ]; then
    echo "faname:$faname"
    echo "conid:$conid"
    echo "taskid:$taskid"
    echo "langid:$langid"
    echo "url:$url"
fi