#!/bin/bash

# ensure consistent working directory
cd $(dirname "$0")/..

# start two numberseq.sh processes
./scripts/numberseq.sh &
./scripts/numberseq.sh
