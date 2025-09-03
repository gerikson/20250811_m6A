#!/bin/bash

for file in *.pileup.bed.gz; do
    # Define output file name
    out="${file%.pileup.bed.gz}.m6A.bed.gz"
    
    echo "Processing $file -> $out"

    # Extract only m6A calls (column 4 == "a")
    zcat "$file" | awk '$4=="a"' | gzip > "$out"
done
