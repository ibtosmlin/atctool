#!/bin/bash

# arguments
arg1=${1}   #url
arg2=${2}   #action

urlname=$arg1
#conid=`echo $arg1 | sed -e 's/_.*$//g'`
filename=${arg1##*/}'.py'
atp $filename $arg2 $urlname