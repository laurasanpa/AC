#!/bin/bash


for ((N=16384;N<67108865;N=N*2))
  do
      ./sumavectorescsections $N >> datos_sections_pc.txt
done
