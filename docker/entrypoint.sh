#!/bin/bash

set -e

cd /home/CMSSW_14_1_0_pre7/src/sonic-workflows

source /cvmfs/cms.cern.ch/cmsset_default.sh
export CMS_PATH=/cvmfs/cms-ib.cern.ch/

cmsenv

cmsRun run.py "$@"