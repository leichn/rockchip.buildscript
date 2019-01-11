#!/bin/bash

LOCALPATH=$(pwd)
OUT=${LOCALPATH}/out
TOOLPATH=${LOCALPATH}/rkbin/tools

PATH=$PATH:$TOOLPATH

[ ! -d ${OUT} ] && mkdir ${OUT}
[ ! -d ${OUT}/rootfs ] && mkdir ${OUT}/rootfs/

finish() {
	echo -e "\e[31m MAKE ROOTFS IMAGE FAILED.\e[0m"
	exit -1
}
trap finish ERR


echo -e "\e[36m Building rootfs! \e[0m"

cd ${LOCALPATH}/buildroot
make

cp ./output/images/rootfs.ext2 ${OUT}/rootfs/
