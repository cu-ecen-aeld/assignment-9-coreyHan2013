#!/bin/bash

cd $(dirname $0)

if [ -d buildroot ]
then
	make -C buildroot distclean
else
	echo "error: buildroot does not exist!"
fi
