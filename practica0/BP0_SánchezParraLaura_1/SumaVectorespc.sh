#!/bin/bash

touch datos.txt

for ((N=65536;N<67108865;N=N*2))
  do
      ./SumaVectoresC_GLOBALMAX $N >> datos_dynamic.txt

done
