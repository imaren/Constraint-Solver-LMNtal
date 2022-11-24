#!/bin/bash

rm result_origin.csv 
rm result_mem.csv  
rm result_ifelse.csv  
count=1001
while true
do

    echo $count 
    sed -e 's/VAR/'$count'/g' seq_origin.il > tmp.il
    timeout 300 /home/imagawa/slim/src/slim -p2 --history-management tmp.il &> ./in.txt
    if [ $? -eq 124 ]; then exit 0
    fi
    ./format5 >> result_origin.csv  

    sed -e 's/VAR/'$count'/g' seq_mem.il > tmp.il
    timeout 300 /home/imagawa/slim/src/slim -p2 tmp.il &> ./in.txt
    if [ $? -eq 124 ]; then exit 0
    fi
    ./format5 >> result_mem.csv  

    sed -e 's/VAR/'$count'/g' seq_ifelse.il > tmp.il
    timeout 300 /home/imagawa/slim/src/slim -p2 tmp.il &> ./in.txt
    if [ $? -eq 124 ]; then exit 0
    fi
    ./format4 >> result_ifelse.csv  

    if [ $count -ge 30001 ]; then exit 0
    fi
    count=`expr $count + 1000`

done