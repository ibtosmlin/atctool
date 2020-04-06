#!/bin/bash

# arguments
arg=${2}
# settings
urlcontest='https://atcoder.jp/'

if [ $arg = 'd' ]; then
# ディレクトリを作成して移動
    conid=${1}
    mkdir -p $conid
    cd $conid
    # 問題のurl
    url="${urlcontest}contests/${conid}/tasks/"
    curl -o ./ul0.txt $url
    cat ./ul0.txt | grep -e 'sec</td>' -e '<td><a href="/contests/'> ./ul1.txt
    cat ./ul1.txt | awk -F "\"" '{print $2}{print $3}' > ./ul2.txt
    cat ./ul2.txt | grep -e 'sec</td>' -e '/contests/'> ./ul3.txt
    sed  -e 's/^.*_//g' -e 's/<.*$//g' -e 's/^>//g' ./ul3.txt > ./ul4.txt
    sed  -e 's/ msec//g' -e 's/ sec//g' ./ul4.txt > ./ul5.txt
    cat ./ul5.txt | while true
    do
        read taskid
        read taskidflag
        if [ -z "$taskid" ] ; then break
        fi
        if [ $taskidflag != '0' ] ; then
            urli="${url}${conid}_${taskid}"
            resp=`curl -LI $urli -w "%{http_code}\n" -s -o /dev/null`
            if [ $resp = 200 ]; then
                mkdir -p $taskid
                cd $taskid
                oj d $urli
                cd ..
            else
                break
            fi
        fi
    done
    rm ./ul*.txt

elif [ $arg = 'c' ]; then
# テンプレートからコードファイルをコピー
# on /abc*** etc
# copy teplate file to contestid folder as taskid.py
# open editor
    faname=${1}
    cp=$(pwd)
    pp=$(dirname $cp)
    langid="${faname##*.}"
    fm="$pp/templates/main.$langid"
    to="$cp/$faname"
    cp $fm $to
    echo "$faname created in $to"
    code $to

elif [ $arg = 't' ]; then
# コードファイルをテスト
# on /abc*** etc
# copy coded file to taskid folder as main.py
# cd taskid folder and call oj t
# return contestid folder
# only for python3
    faname=${1}
    cp=$(pwd)
    taskid="${faname%.*}"
    langid="${faname##*.}"
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

elif [ $arg = 's' ]; then
# settings
    faname=${1}
    cp=$(pwd)
    taskid="${faname%.*}"
    langid="${faname##*.}"
    conid=$(basename $cp)
# copy
    fm="$cp/$faname"
    to="$cp/$taskid/main.$langid"
    cp $fm $to
    echo "main.$langid created in $to"
    cd $taskid
# url settings
    url="${urlcontest}contests/${conid}/tasks/${conid}_${taskid}"
    oj s $url "main.$langid"
    cd ..

elif [ $arg = 'l' ]; then
# ログイン
    oj login $urlcontest

else
    echo '???'
fi