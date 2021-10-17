#!/bin/bash

mkdir -p ${PREFIX}/${target_machine}-${ctng_vendor}-linux-gnu/sysroot
pushd ${PREFIX}/${target_machine}-${ctng_vendor}-linux-gnu/sysroot > /dev/null 2>&1
cp -Rf "${SRC_DIR}"/binary/* .
mkdir -p usr/include
cp -Rf "${SRC_DIR}"/binary-tzdata/* usr/
cp -Rf "${SRC_DIR}"/binary-glibc-headers/include/* usr/include/
cp -Rf "${SRC_DIR}"/binary-glibc-devel/* usr/
cp -Rf "${SRC_DIR}"/binary-glibc-static/* usr/
cp -Rf "${SRC_DIR}"/binary-glibc-common/* .

mv usr/lib/* usr/lib64/
rm -rf usr/lib

rm -f $PWD/lib64/libnsl*.so
rm -f $PWD/usr/lib64/libnsl.a
rm -f $PWD/usr/lib64/libnso.so

ln -s $PWD/lib64 $PWD/lib

ln -s $PWD/usr/lib64 $PWD/usr/lib

cp "${SRC_DIR}"/binary-freebl/lib64/libfreebl3.so ${PWD}/lib64/.
ln -s ${PWD}/lib64/libfreebl3.so ${PWD}/usr/lib64/libfreebl3.so

popd
