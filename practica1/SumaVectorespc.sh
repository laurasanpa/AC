#!/bin/bash

touch datos_global_atc.txt

for ((N=16384;N<67108865;N=N*2))
  do
      ./sumavectoresc $N >> datos_global_atc.txt

done
