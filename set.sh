#!/bin/bash
./unset.sh
target="$(cat target.txt)"
awk '{print $0 " #--rcHorse--"}' rcHorse.sh | sed "s/rcTarget/$target/" >> $HOME/$target
