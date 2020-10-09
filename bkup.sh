#!/bin/bash

fm='/home/ibtosm/work/atc/prac'
to='/home/ibtosm/work/atc/backups'

find $fm -maxdepth 1 -mtime +30 | while read -r fname
do
    cp -v -u -r $fname $to
    rm -v -r $fname
done
echo 'completed!'
