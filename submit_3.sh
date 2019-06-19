#!/bin/bash

date
file="$1"
CMSSW="CMSSW_10_5_0_pre2"
CMSSW_TGZ="CMSSW_10_5_0_pre2.tgz"

tar -xf $CMSSW_TGZ 
rm $CMSSW_TGZ
source /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc700

scramv1 project CMSSW $CMSSW
cd $CMSSW/src

echo "HELLO"
echo $PWD
scram b ProjectRename
eval `scramv1 runtime -sh`

echo "CMSSW: "$CMSSW_BASE

sed -i "s+XXX+${file}+g" MUO-RunIIAutumn18MiniAOD-00002_1_cfg.py 
cmsRun MUO-RunIIAutumn18MiniAOD-00002_1_cfg.py

fName="MINIAOD_${RANDOM}_${RANDOM}.root"
mv MUO-RunIIAutumn18MiniAOD-00002.root $fName
xrdcp -f $fName root://cmseos.fnal.gov//eos/uscms/store/user/jkrupa/pf_studies/ZMUMU/MINIAOD2
rm $fName 

date
