#!/bin/bash

set -e

cd /home/CMSSW_14_1_0_pre7/src/sonic-workflows

source /cvmfs/cms.cern.ch/cmsset_default.sh
cmsenv
export CMS_PATH=/etc/

env | grep PATH
env | grep cvmfs

cmsRun run.py "$@"