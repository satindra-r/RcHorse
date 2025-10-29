#!/bin/bash
./unset.sh
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
awk '{print $0 " #--rcHorse--"}' rcHorse.sh | sed "s/rcTarget/$target/" >> $HOME/$target