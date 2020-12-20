#!/bin/bash

# working directory
cdat

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
if [ $# = 3 ]; then
    url=${3}
fi


if [ $arg2 = 'd' ]; then
    x-www-browser $url
    echo "Downloading....."
    mkdir -p $taskid
    cd $taskid
    oj d $url
    cd ..
    fm="$pp/templates/main.$langid"
    to="$cp/$faname"
    cp $fm $to
    echo "$faname created in $to"
    code $to

elif [ $arg2 = 't' ]; then
    echo "Testing....."
    fm="$cp/$faname"
    to="$cp/$taskid/main.$langid"
    cp $fm $to
    echo "main.$langid created in $to"
    cd $taskid
    if [ $langid = 'py' ]; then
        oj t -c 'python3 main.py' -S
    elif [ $langid = 'cpp' ]; then
        g++ main.cpp
        oj t
    else
        echo '対応していません'
    fi
    cd ..


elif [ $arg2 = 's' ]; then
# submitt
    echo "Submitting....."
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