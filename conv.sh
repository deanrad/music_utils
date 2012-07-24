#!/bin/bash
set -x
for i in `ls -1rt Set2*.wav`; do
	ffmpeg -i $i -ab 128000 $i.mp3
done
