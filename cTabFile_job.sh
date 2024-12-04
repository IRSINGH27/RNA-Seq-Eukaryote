#!/bin/bash

source activate stringtieEnv


bamFolder=""
deNovoTranscriptFile=""
outputFolder=""
ncores=15
for bamFile in $bamFolder
do
    stringtie -p $ncores -e -B -G $deNovoTranscriptFile -o "$outputFolder/$(basename $bamFile .bam).gtf" $bamFile;
done




# Example
# stringtie -p 15 -e -B -G s_species_vero_denov_transcript.gtf -o E101_S77_.gtf E101_S77_.bam;
