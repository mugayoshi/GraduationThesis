#!/bin/zsh

for file in ./*
do
    echo convert ${file}
    nkf -u ${file} > ${file}.tmp
    cat ${file}.tmp > ${file}
    rm ${file}.tmp
done
