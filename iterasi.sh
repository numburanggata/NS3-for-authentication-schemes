#!/bin/bash

#RUNNING >> bash iterasi.sh
num_iterations="5"

# Base command with fixed parameters
base_command="./waf --run 'iot_PUF_mod_v3 --SD=20 --M1=68 --M2=44 --M3=36 --M4=52 " #64-bit REI
base_command="./waf --run ' --M1=78 --M2=48 --M3=38 --M4=58 " #80-bit REI
#base_command="./waf --run ' --M1=108 --M2=60 --M3=44 --M4=76 " #128-bit FIN
#base_command="./waf --run ' --M1=113 --M2=62 --M3=45 --M4=79 " #136-bit FIN
#base_command="./waf --run ' --M1=128 --M2=68 --M3=48 --M4=88 " #160-bit FIN
#base_command="./waf --run ' --M1=138 --M2=72 --M3=50 --M4=94 " #176-bit RAK
#base_command="./waf --run ' --M1=148 --M2=76 --M3=52 --M4=100 " #192-bit RAK
#base_command="./waf --run ' --M1=168 --M2=84 --M3=56 --M4=112 " #224-bit RAK


# Loop to run the command with different values of --MU
for ((i=20; i<=$num_iterations; i+=20)); do
    echo "Running iteration $i with --MU=$i"
    for ((l=20; l<=$num_iterations; l+=20)); do
        echo "Running iteration $l with --SD=$l"
        eval "$base_command --MU=$i --SD=$l'"
    done
done
