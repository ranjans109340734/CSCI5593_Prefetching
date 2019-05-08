# CSCI5593_Prefetching
**Study and implementation of Prefetching algorithms**

For our current project we are using Google Cloud Compute Engine with Ubuntu 18.04 Operating System.
gem5 was installed and various configurations were build on this machine.

1. Install required dependencies
run command :
sudo apt install scons build-essential git m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev python-dev python automake libboost-all-dev

2. Download gem5 source code
git clone https://gem5.googlesource.com/public/gem5

3. Building gem5 on the system
   1. change to gem5 directory.
   1. Run this commandscons build/X86/gem5.opt -j 9
   1. Test gem5 by running your first Hello World Program: build/X86/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/x86/linux/hello
   
4. Installing SPEC CPU 2017
https://www.spec.org/cpu2017/Docs/install-guide-unix.html#s4
> More info can be found on 
https://www.spec.org/cpu2017/

5. Integrating SPEC 2017 with Gem5
 > Copy spec_cpu2017.sh to gem5 folder.
 > Copy spec2017_config.py to location: ~/gem5/configs/example/
 > Copy spec2017_benchmark.py to location: ~/gem5/configs/example/
 > Move to gem5 folder and run command: chmod +x ./spec_cpu2017.sh
 > chmod +x ./spec_cpu2017.sh $BENCHMARK /home/ramrahimwalmart11/gem5out
 
 6. Testing Basic Prefeching Models in Classic Memory Model
 > Move to gem5 directory
 > Build X86 system with command: scons build/X86/gem5.opt -j 9
 > L1, L2, other cache properties can be modified in file: ~gem5/configs/example/memtest.py
 > Run command: ./build/X86/gem5.opt configs/example/memtest.py -l 100000
 > Output can be verified at ~gem5/m5out/stats.txt
 
 7. To run with SPEC CPU 2017 Benchmarrks run below command:
 > Move to gem5 directory.
 > Run command: ./spec_cpu2017.sh <benchmark name> <full output directory path>
 > Output can be verified at output_directory_path/stats.txt


