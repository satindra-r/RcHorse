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
bashrc="$(awk '$NF!="#--rcHorse--" {print $0}' $HOME/$target)"
echo "$bashrc" > "$HOME/$target"