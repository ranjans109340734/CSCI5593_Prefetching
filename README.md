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


