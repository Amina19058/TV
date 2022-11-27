#!/bin/bash
sysbench --test=cpu run >> result.txt
sysbench --test=fileio --file-test-mode=seqwr run >> result.txt
sysbench --test=fileio --file-total-size=100G cleanup
sysbench --test=memory run >> result.txt
sysbench  --threads=2  --time=60 cpu --cpu-max-prime=64000 run >> result.txt
sysbench  --threads=10  --time=60 cpu --cpu-max-prime=64000 run >> result.txt
sysbench  --threads=100  --time=60 cpu --cpu-max-prime=64000 run >> result.txt
