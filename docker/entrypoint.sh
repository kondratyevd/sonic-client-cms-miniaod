#!/bin/bash

set -e

cd /home/CMSSW_16_0_0_pre4/src/sonic-workflows

source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`

export CMS_PATH=/cvmfs/cms-ib.cern.ch/

cmsRun run.py "$@"