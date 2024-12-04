#!/bin/bash

source activate stringtieEnv

refFile=""
outputFolder=""
bamFileFolder="" # sorted Bam File
mergedTranscriptName=""
ncores=15


for bamFile in $bamFileFolder/*.bam
do
    stringtie -p $ncores -G $refFileFolder -o "$outputFolder/$(basename $i .bam).gtf" $bamFile;
    echo "$outputFolder/$(basename $i .bam).gtf" >> "$outputFolder/mergeList.txt
done

stringtie --merge -p $ncores -G $refFileFolder -o "$outputFolder/$mergedTranscriptName" "$outputFolder/mergeList.txt

# Example
# stringtie -p 15 -G GCF_015252025.1_Vero_WHO_p1.0_genomic.gff -o E101_S77_.gtf E101_S77_.bam;
