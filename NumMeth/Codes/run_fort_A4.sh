#!/bin/bash
gfortran fort_A4.f90 -o fort -llapack -lblas
./fort
gnuplot -persist << EOFMarker
    set grid
    plot 'output.csv' with lines
EOFMarker