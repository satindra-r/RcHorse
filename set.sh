#!/bin/bash
curl -s https://raw.githubusercontent.com/satindra-r/rcHorse/main/unset.sh | sh

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

curl -s https://raw.githubusercontent.com/satindra-r/rcHorse/main/rcHorse.sh | awk '{print $0 " #--rcHorse--"}' | sed "s/rcTarget/$target/" >> $HOME/$target