#!/bin/bash

# arguments
arg=${1}
# settings
urlcontest='https://atcoder.jp/'

if [ $arg = 'd' ]; then
# ディレクトリを作成して移動
    conid=${2}
    mkdir -p $conid
    cd $conid
    # 問題のurl
    url="${urlcontest}contests/${conid}/tasks/${conid}_"
    for i in {a..z}
    do
        urli=$url$i
        resp=`curl -LI $urli -w "%{http_code}\n" -s -o /dev/null`
        if [ $resp = 200 ]; then
            mkdir -p $i
            cd $i
            oj d $urli
            cd ..
        else
            break
        fi
    done

elif [ $arg = 'c' ]; then
# テンプレートからコードファイルをコピー
# on /abc*** etc
# copy teplate file to contestid folder as taskid.py
# open editor
    faname=${2}
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
    faname=${2}
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
    faname=${2}
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