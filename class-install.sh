#!/bin/bash

APPNAME="class"
APPVERSION="interactingv_master"

echo -e '\n'
echo  '=========================================================='
echo  ' compiling and installing '${APPNAME}' for '${_SCIAMA_SYS}
echo  '=========================================================='

export CFLAGS=""

module purge
module load system/intel64
module load intel_comp/2019.2
module load gsl/2.5
# module load cpython/2.7.16
module load cpython/3.7.1

#cd src
make clean
export PREFIX=$HOME/programs/${APPNAME}/${APPVERSION}/$_SCIAMA_SYS/$_SCIAMA_PYTHON
make
if [ $? -ne 0 ]; then
    echo -e '\n'
    echo '================================================='
    echo '------------------ ERROR ------------------------'
    echo '================================================='
    exit 1
fi
#mkdir -p $PREFIX

cp class $PREFIX
cp -rfv include $PREFIX/
cp -rfv python $PREFIX/
ln -s `pwd`/bbn $PREFIX/bbn
ln -s `pwd`/hyrec $PREFIX/hyrec
make clean
module list -t 2> $PREFIX/MODULES
echo -e '\n'
echo '================================================='
echo '----------------- SUCCESS -----------------------'
echo 'application compiled and installed in '${_SCIAMA_SYS}
echo '================================================='
