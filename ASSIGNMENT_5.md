# Docker & Kubernetes

Full code on github:
https://github.com/Amina19058/TV

## Task 1. Dockerfile

Best practices ([retrieved from](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)) that I used:

- Use trusted base images - official images on DockerHub
- Use lightweight images to decrease image size
- Use .dockerignore to exclude unneeded files
- Place the commands that are less likely to change, and easier to cache, first
- COPY instead of ADD
- Join consecutive RUN with &
- Run as nonroot user for safety
- Use linter for dockerfile: hadolint
- Combine RUN `apt-get update` with `apt-get install` in the same RUN statement

```sh
docker run -it myimage:latest   
appuser@9854c241a61c:/$ ls
bin   dev  home  media  opt   result.txt  run     sbin  sys  usr
boot  etc  lib   mnt    proc  root        run.sh  srv   tmp  var
appuser@9854c241a61c:/$ cat result.txt
sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Prime numbers limit: 10000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:  8593.55

General statistics:
    total time:                          10.0002s
    total number of events:              85943

Latency (ms):
         min:                                    0.11
         avg:                                    0.12
         max:                                    0.33
         95th percentile:                        0.12
         sum:                                 9989.90

Threads fairness:
    events (avg/stddev):           85943.0000/0.00
    execution time (avg/stddev):   9.9899/0.00

sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Extra file open flags: (none)
128 files, 16MiB each
2GiB total file size
Block size 16KiB
Periodic FSYNC enabled, calling fsync() each 100 requests.
Calling fsync() at the end of test, Enabled.
Using synchronous I/O mode
Doing sequential write (creation) test
FATAL: Cannot create file 'test_file.0' errno = 9 (Bad file descriptor)
sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1KiB
  total size: 102400MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 82213874 (8220667.57 per second)

80286.99 MiB transferred (8028.00 MiB/sec)


General statistics:
    total time:                          10.0001s
    total number of events:              82213874

Latency (ms):
         min:                                    0.00
         avg:                                    0.00
         max:                                    0.20
         95th percentile:                        0.00
         sum:                                 4263.26

Threads fairness:
    events (avg/stddev):           82213874.0000/0.00
    execution time (avg/stddev):   4.2633/0.00

sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 2
Initializing random number generator from current time


Prime numbers limit: 64000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:  1532.63

General statistics:
    total time:                          60.0009s
    total number of events:              91960

Latency (ms):
         min:                                    1.28
         avg:                                    1.30
         max:                                    8.37
         95th percentile:                        1.34
         sum:                               119917.99

Threads fairness:
    events (avg/stddev):           45980.0000/72.00
    execution time (avg/stddev):   59.9590/0.00

sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 10
Initializing random number generator from current time


Prime numbers limit: 64000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:  2852.91

General statistics:
    total time:                          60.0022s
    total number of events:              171182

Latency (ms):
         min:                                    1.33
         avg:                                    3.50
         max:                                   42.28
         95th percentile:                       15.27
         sum:                               599498.01

Threads fairness:
    events (avg/stddev):           17118.2000/1226.00
    execution time (avg/stddev):   59.9498/0.02

sysbench 1.0.20 (using system LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 100
Initializing random number generator from current time


Prime numbers limit: 64000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:  2722.72

General statistics:
    total time:                          60.0227s
    total number of events:              163426

Latency (ms):
         min:                                    1.33
         avg:                                   36.64
         max:                                  363.50
         95th percentile:                       80.03
         sum:                              5988484.71

Threads fairness:
    events (avg/stddev):           1634.2600/43.36
    execution time (avg/stddev):   59.8848/0.07

```

## Task 2. Dockerize an application

1. Write a rabbitmq reading application (https://www.rabbitmq.com/)
2. Create dockerfile
3. Pass variables to configure app (host,port,user,password)
4. Tag and push your image into docker-hub
