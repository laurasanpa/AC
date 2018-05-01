#!/bin/bash
	for((j=1; j<4; j++))
		do
    echo `./schedule-clause $j $i` >> salida_schedule.txt
done
