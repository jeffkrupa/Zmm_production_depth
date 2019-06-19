#!/bin/bash


exe=$1
file=$2
echo "running MINIAOD on ZMUMU samples "
echo "universe                =vanilla" > tmp.sub
echo "executable              = "$exe >> tmp.sub
echo "Should_Transfer_Files   = YES" >> tmp.sub
echo "WhenToTransferOutput    = ON_EXIT_OR_EVICT" >> tmp.sub
echo "Transfer_Input_Files    = "/uscms_data/d3/jkrupa/pf_studies/ZMUMU/CMSSW_10_5_0_pre2/src/$exe, /uscms_data/d3/jkrupa/pf_studies/ZMUMU/CMSSW_10_5_0_pre2.tgz >> tmp.sub
echo "arguments               = ${file} /uscms_data/d3/jkrupa/pf_studies/x509up" >> tmp.sub
echo "output                  = output/${RANDOM}.out" >> tmp.sub
echo "error                   = error/${RANDOM}.err"  >> tmp.sub
echo "log                     = log/${RANDOM}.log"    >> tmp.sub
echo "request_memory          = 4000" >> tmp.sub
echo "+JobFlavour = \"workday\"  " >> tmp.sub
echo "queue 1" >> tmp.sub
condor_submit tmp.sub

