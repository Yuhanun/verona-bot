#!/bin/bash

# Number = "$1"
# Run "/opt/verona-bot/input/$1.verona"
# And output into /opt/verona-bot/output/$1.verona
/opt/verona/build_ninja/dist/veronac --run "/opt/verona-bot/input/$1.verona" > "/opt/verona-bot/output/$1.verona"