FROM ubuntu:22.04
LABEL vendor=Iron\ Gate\ Studio \
      se.irongatestudio.last-change="2022-09-29"
RUN apt-get update && apt-get install -y \
    curl \
    libatomic1 \
    libpulse-dev \
    libpulse0 \
    && rm -rf /var/lib/apt/lists/*
COPY steamclient.so /usr/lib
WORKDIR /irongate
ENV PATH="/irongate:${PATH}"
CMD /bin/bash

