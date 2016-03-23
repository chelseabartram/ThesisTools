#!/bin/bash

numPages=0
numPages="$(wc -w < "/Users/cbartram/Thesis/gkg_dissertation.pdf")"
echo $(date +"%s") $numPages >> words.txt
echo '\n'
gnuplot <<-EOF
set xdata time
set timefmt "%s"
set format x "%H:%M:%S"
plot "words.txt"  using 1:2 
EOF
