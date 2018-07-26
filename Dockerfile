FROM ubuntu:xenial

RUN     apt-get update \
        && apt-get install -y \
            binutils \
            git-core \
            make \
            python \
            python-pip \
            sdcc \
            vim \
            virtualenv \
        && apt-get clean


WORKDIR /work
ADD     . .
RUN     make dev
