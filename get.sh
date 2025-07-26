#!/bin/bash
target="$(cat target.txt)"
horseData="$(awk '$1=="#horseVision" {print $0}' $HOME/$target)"
echo "$horseData"
echo "$horseData" >> ./data/horseData
