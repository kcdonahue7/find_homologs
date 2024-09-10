#!/bin/bash

tblastn -query "$1" -subject "$2" -outfmt '6 qseqid sseqid pident length qlen slen' | \
awk '$3 > 30 && $4 / $5 > 0.9' >"$3"

match_count=$(wc -l < "$3")
echo "Number of matches: $match_count"
