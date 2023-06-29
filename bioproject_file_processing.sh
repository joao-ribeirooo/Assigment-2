#!/bin/bash

cd 
cd Documents
cd Bioproject

mypath=`pwd`


for filename in $(ls $mypath | grep -v cut | grep -v ipyrad-assembly)
do
    echo ${filename}
    zcat ${filename} | head -n 2000000 | bgzip > cut/${filename}
    #echo $filename
    #echo cut/$filename
done
