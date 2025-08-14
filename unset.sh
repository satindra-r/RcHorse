#!/bin/bash
target="$(cat target.txt)"
bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/$target)"
echo "$bashrc" > "$HOME/$target"
