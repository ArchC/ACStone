#!/bin/bash

#Make a loop for each file
for I in `ls *.${ARCH}`
  do
 
  ${SIMULATOR} --load_obj=${I} --gdb

done

