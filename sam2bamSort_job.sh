#!/bin/bash
source activate /home/aswin/irsingh/.conda/envs/rnaSeqEnv

samFolder=''
bamFolder=''

for samFile in $samFolder/*
do
    samtools sort -@ $nocres -O BAM -o $bamFolder/$(basename $samFile .sam).bam $samFile;
done

# Example
# samtools sort -@ 15 -O BAM -o /home/aswin/irsingh/amit_singh_rna_Seq/Ragini_eukar/Ragini_VeroE6/output/s_species/sortBamFiles/E101_S77_.bam /home/aswin/irsingh/amit_singh_rna_Seq/Ragini_eukar/Ragini_VeroE6/output/s_species/samFiles/E101_S77_.sam;