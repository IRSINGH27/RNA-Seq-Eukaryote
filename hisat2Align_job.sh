#!/bin/bash

source activate rnaSeqEnv

fastqSampleList=''
gtfFile=''
outputForHisatIndex=''
outputForSamFile=''
ncores=15


extract_splicte_sites.py $gtfFile >$outputForHisatIndex/$(basename $gtfFile .gtf).ss
extract_exons.py $gtfFile > $outputForHisatIndex/$(basename $gtfFile .gtf).exon

hisat2-build --ss $outputForHisatIndex/$(basename $gtfFile .gtf).ss --exon $outputForHisatIndex/$(basename $gtfFile .gtf).exon $outputForHisatIndex/$(basename $gtfFile .gtf)_tran

for fastq in $fastqSampleList/*
do
    hisat2 -p $ncores --dta -x $outputForHisatIndex/$(basename $gtfFile .gtf)_tran -1 $fastq"_R1_001.fastq.gz" -2 $fastq"_R2_002.fastq.gz" -S $outputForSamFile/$fastq"_.sam";
done

# Example
# hisat2 -p 15 --dta -x GCF_015252025.1_Vero_WHO_p1.0_genomic_tran -1 E109_S37_R1_001.fastq.gz -2 E109_S37_R2_001.fastq.gz -S samFiles/E109_S37_.sam;
