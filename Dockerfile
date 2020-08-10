FROM ubuntu:18.04

# Install git/yosys/node/npm
RUN apt update
RUN apt install -y tzdata
ENV TZ=Asia/Tokyo
RUN apt install -y git yosys nodejs npm

# Fetch netlistsvg
RUN git clone https://github.com/nturley/netlistsvg.git /netlistsvg
RUN npm install -g ajv ajv-errors clone elkjs fs-extra json5 lodash onml yargs

# Fetch pull request for hierarchical compiling
WORKDIR /netlistsvg
RUN git fetch origin pull/92/head:hierarchy
RUN git checkout hierarchy

WORKDIR /documents
ENV NODE_PATH=/usr/local/lib/node_modules
