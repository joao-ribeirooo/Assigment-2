#!/bin/bash

set -euo pipefail

cd
cd Documents
mkdir -p Bioproject
cd Bioproject

while read line
do
    fasterq-dump ${line}
    bgzip ${line}_1.fastq
    bgzip ${line}_2.fastq
done < "/home/ribeiroriri/Documents/TESTE.csv"
