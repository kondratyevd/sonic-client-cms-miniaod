set -e

cd /home/CMSSW_14_1_0_pre7/src/sonic-workflows

source /cvmfs/cms.cern.ch/cmsset_default.sh
cmsenv

# Run the cmsRun command with the address parameter
cmsRun run.py --address "${ADDRESS}"