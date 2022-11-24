#!/bin/bash

rm result_largefast.csv 
count=1001
while true
do

    echo $count 
    sed -e 's/VAR/'$count'/g' up_gcd_ifelse_largefast.il > tmp.il
    
    timeout 300 /home/imagawa/slim/src/slim -p2 tmp.il &> ./in.txt

    if [ $? -eq 124 ]; then exit 0
    fi
    ./format >> result_largefast.csv  
    if [ $count -ge 100001 ]; then exit 0
    fi
    count=`expr $count + 1000`

done