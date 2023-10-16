#!/bin/bash
export filename=$(cat filename.txt)
export extension=$(cat extension.txt)
export model=$(cat model.txt)

rg="rembg"
if [ "$model" == "$rg" ]
then
	./rembg.sh
else
	./scale4x.sh
fi
