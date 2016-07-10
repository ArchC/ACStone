#!/bin/bash

for I in *.x86.out ; do

  TMP=`echo $I | cut -d '.' -f '1 2'`
  diff --brief --report-identical-files ${TMP}.${ARCH}.out  $I   # data/$TMP.data

done
