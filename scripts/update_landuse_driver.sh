#!/bin/bash
set -eu

# Update land use fields in the end of year restart
# This file will have a name of form aiihca.da??110
./scripts/update_landuse.py work/atmosphere/INPUT/cableCMIP6_LC_1850-2015.nc work/atmosphere/aiihca.da??110
if [[ $? != 0 ]]; then
    echo "Error from update_landuse.py" >&2
    exit 1
fi
