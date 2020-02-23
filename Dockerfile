FROM ubuntu:18.04

LABEL Maintainer Yuhanun <y.citgez@student.utwente.nl>

# Update lists
RUN /bin/bash -c "apt-get update"

# Upgrade packages, -y marks everything "yes"
RUN /bin/bash -c "apt-get dist-upgrade -y" 

# Install dependencies
RUN /bin/bash -c "apt-get -y install \
    clang-8 \
    cmake \
    ninja-build \
    python3 \
    clang-format \
    clang-tools \
    git \
    "

# Clone git repo
RUN /bin/bash -c "git clone --recursive https://github.com/microsoft/verona \
    /opt/verona \
    "

# Build it
RUN /bin/bash -c "cd /opt/verona && \
    mkdir build_ninja && \
    cd build_ninja && \
    cmake ..  \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++-8 \
        -DCMAKE_C_COMPILER=/usr/bin/clang-8 \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release && \
    ninja install \
    "

# Make directories for the verona bot
RUN /bin/bash -c "mkdir -p /opt/verona-bot/scripts"

# Copy the entrypoint over
COPY ./scripts/run.sh /opt/verona-bot-scripts/run.sh

# Set entrypoint fo when the docker container runs
ENTRYPOINT [ "/opt/verona-bot-scripts/run.sh" ]