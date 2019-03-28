#!/bin/bash

set -xue

# so we can run this script from any where
export PYTHONPATH="{{SAMBA_REPO_DIR}}/bin/python"

# arg 1 with default
NUM_USERS=${1-100}
NUM_MAX_MEMBERS=${2-100}

sudo python3 {{SAMBA_REPO_DIR}}/script/traffic_replay \
    --debuglevel 3 \
    --username {{SAMBA_USERNAME}} \
    --password {{SAMBA_PASSWORD}}  \
    --realm {{SAMBA_REALM}} \
    --workgroup {{SAMBA_REALM}} \
    --fixed-password iegh1haevoofoo3looT9  \
    --random-seed=1 \
    --option='ldb:nosync=true' \
    --generate-users-only \
    --number-of-users=${NUM_USERS} \
    --number-of-groups=$(expr $NUM_USERS / 10) \
    --max-members=${NUM_MAX_MEMBERS} \
    --average-groups-per-user=10 \
    /usr/local/samba/private/sam.ldb