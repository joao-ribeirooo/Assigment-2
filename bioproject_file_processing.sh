#!/bin/bash

cd 
cd Documents
cd Bioproject
mkdir cut

mypath=`pwd`

for filename in $(ls $mypath | grep -v cut | grep -v ipyrad-assembly)
do
    echo ${filename}
    zcat ${filename} | head -n 2000000 | bgzip > cut/${filename}
done
