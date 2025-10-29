#!/bin/bash
case $(basename $SHELL) in
	"bash")
		target=".bashrc"
		;;
	"zsh")
		target=".zshrc"
        ;;
    *)
		exit
esac
horseData="$(awk '$1=="#horseVision" {print $0}' $HOME/$target)"
echo "$horseData"
echo "$horseData" >> ./data/horseData
