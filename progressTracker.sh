#!/bin/bash

numPages=0
numPages="$(pdfinfo "/Users/cbartram/Thesis/gkg_dissertation.pdf" | grep Pages | sed 's/[^0-9]*//')"
echo $(date +"%s") $numPages >> pages.txt
echo '\n'
gnuplot <<-EOF
set xdata time
set timefmt "%s"
set format x "%H:%M:%S"
plot "pages.txt"  using 1:2 
EOF
