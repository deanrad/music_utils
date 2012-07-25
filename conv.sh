#!/bin/bash
set -x
for i in `ls -1rt *.WAV`; do
	ffmpeg -i $i -ab 128000 $i.mp3
done
