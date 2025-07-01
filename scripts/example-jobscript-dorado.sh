#!/bin/bash

# Command line example when no SBATCH directives are used:
#batch -p priority -c 8 --mem 49152 -t 168:0:0 -w gpu01 doDorado.sh 0.9.1 Nanopore/pod5 sup keyword


# required positional parameters: [software version] [input directory] [basecalling model] [random Keyword]
VER=$1
DIR=$2
MODEL=$3
KEYWORD=$4

# load the specific version of dorado
module load dorado/$VER

# run dorado
dorado basecaller --device "cuda:0" $MODEL $DIR > dorado.$VER.$KEYWORD.bam

