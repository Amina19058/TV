FROM ubuntu:latest

LABEL description "Sysbench Docker container"

RUN apt-get update \ 
    && apt-get -y install sysbench

COPY run.sh run.sh
COPY result.txt result.txt

RUN useradd -m appuser \
    && chmod +x run.sh \
    && chmod 777 result.txt
USER appuser

RUN ./run.sh

