#!/bin/bash
cat /proc/cpuinfo | grep flag | head -1
cd /home/grid/testbed/tb253/lab3/vec_samples/src 
ml icc
arr=( "-xSSE2" "-xSSE3" "-xAVX"  )
for j in "${arr[@]}"; do
  for i in {1..3}; do
    x1=$(date +%M)
    x2=$(date +%S)
    echo icpc -std=c++17 -O$i $j lab3_tsybulskyi.cpp -o file-$x1-$x2
    icpc -std=c++17 -O$i $j lab3_tsybulskyi.cpp -o file-$x1-$x2
    echo "$j $i:"
    time ./file-$x1-$x2
  done 
done