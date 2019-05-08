#!/bin/bash
#Integrating SPEC 2017 with Gem5

gem5_dir='/home/ramrahimwalmart11/gem5'
spec2017_dir='/home/ramrahimwalmart11/spec_cpu2017'
Args=$# 

if [[ "$Args" != 2 ]]; then 
    echo "spec_cpu2017.sh"
    echo "USAGE: spec_cpu2017.sh <BENCHMARK> <OUTPUT_DIR>"
    echo "EXAMPLE: ./spec_cpu2017.sh gcc /FULL/PATH/TO/output_dir"
    exit
fi

BENCHMARK=$1                    # Benchmark name, e.g. bzip2
OUTPUT_DIR=$2                   # Directory to place run output.

#Benchmarks 
PERLBENCH_CODE=600.perlbench_s
GCC_CODE=602.gcc_s
OMNETPP_CODE=620.omnetpp_s
MCF_CODE=605.mcf_s
X264_CODE=625.x264_s
LEELA_CODE=641.leela_s
EXCHANGE2_CODE=648.exchange2_s
LBM_CODE=619.lbm_s
IMAGICK_CODE=638.imagick_s

BENCHMARK_CODE="none"

if [[ "$BENCHMARK" == "perlbench" ]]; then
    BENCHMARK_CODE=$PERLBENCH_CODE
fi
if [[ "$BENCHMARK" == "gcc" ]]; then
    BENCHMARK_CODE=$GCC_CODE
fi
if [[ "$BENCHMARK" == "omnetpp" ]]; then
    BENCHMARK_CODE=$OMNETPP_CODE
fi
if [[ "$BENCHMARK" == "mcf" ]]; then
    BENCHMARK_CODE=$MCF_CODE
fi
if [[ "$BENCHMARK" == "x264" ]]; then
    BENCHMARK_CODE=$X264_CODE
fi
if [[ "$BENCHMARK" == "leela" ]]; then
    BENCHMARK_CODE=$LEELA_CODE
fi
if [[ "$BENCHMARK" == "exchange2" ]]; then
    BENCHMARK_CODE=$EXCHANGE2_CODE
fi
if [[ "$BENCHMARK" == "lbm" ]]; then
    BENCHMARK_CODE=$LBM_CODE
fi
if [[ "$BENCHMARK" == "imagick" ]]; then
    BENCHMARK_CODE=$IMAGICK_CODE
fi
if [[ "$BENCHMARK_CODE" == "none" ]]; then
    echo "$ BENCHMARK input does not match to spec 2017!!"
    exit 1
fi


if [[ !(-d "$OUTPUT_DIR") ]]; then
    echo "No such output directory: $OUTPUT_DIR ,exiting program!!"
    exit 1
fi


RUN_DIR=$spec2017_dir/benchspec/CPU/$BENCHMARK_CODE/run/run_base_test\_mytest-m64.0000
SCRIPT_OUT=$OUTPUT_DIR/runscript.log  

echo ""
echo "Changing to SPEC benchmark runtime directory: $RUN_DIR" | tee -a $SCRIPT_OUT
cd $RUN_DIR
 
echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "------- Starting gem5! ------------" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
echo "" | tee -a $SCRIPT_OUT
 
# Actually launch gem5!
$gem5_dir/build/X86/gem5.opt --outdir=$OUTPUT_DIR $gem5_dir/configs/example/spec17_config.py --benchmark=$BENCHMARK --benchmark_stdout=$OUTPUT_DIR/$BENCHMARK.out --benchmark_stderr=$OUTPUT_DIR/$BENCHMARK.err --num-cpus=1 --ruby --l1d_size=64kB --l1i_size=64kB --l2_size=512kB --mem-size=4GB --l1d_assoc=8 --l1i_assoc=8 --l2_assoc=8 --maxinsts=100000 | tee -a $SCRIPT_OUT


