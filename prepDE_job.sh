#!/bin/bash

source activate stringtieEnv

inputFolder=""
outputFolder=""

python prepDE.py -i $inputFolder -g "$outputFolder/gene_count_matrix.csv" -t "$outputFolder/transcript_count_matrix.csv"