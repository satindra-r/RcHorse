#!/bin/bash
case $(basename "$SHELL") in
  "bash")
    target=".bashrc"
    ;;
  "zsh")
    target=".zshrc"
    ;;
  *)
    exit 1
    ;;
esac

if [ -f "$HOME/$target" ]; then
  awk '$NF != "#--rcHorse--" {print $0}' "$HOME/$target" > temp_file && mv temp_file "$HOME/$target"
fi

echo "$(awk '{print $0 " #--rcHorse--"}' rcHorse.sh)" >> "$HOME/$target"
