from pathlib import Path


PATCH_PATH = Path("/home/CMSSW_16_0_0_pre4/src/sonic-workflows/step4_PAT.py")
TARGET_FILE = "/store/mc/Run3Summer23DRPremix/TTtoLNu2Q_TuneCP5_13p6TeV_powheg-pythia8/AODSIM/130X_mcRun3_2023_realistic_v14-v2/2540011/44a2a447-08f3-42f0-819e-1da4e11d3f10.root"

s = PATCH_PATH.read_text()
start = s.index('process.source = cms.Source("PoolSource",')
end = s.index("secondaryFileNames = cms.untracked.vstring()")

replacement = f"""process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring(
        '{TARGET_FILE}'
    ),
    """

PATCH_PATH.write_text(s[:start] + replacement + s[end:])
