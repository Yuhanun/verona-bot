#!/bin/bash

# Command to run container:  
# docker run -v /opt/verona-bot:/opt/verona-bot yuhanuncitgez/verona-bot:latest "{num}"
# Number = "$1"
# Run "/opt/verona-bot/input/$1.verona"
# And output into /opt/verona-bot/output/$1.txt
/opt/verona/build_ninja/dist/veronac --disable-colors --run "/opt/verona-bot/input/$1.verona" &> "/opt/verona-bot/output/$1.txt" 