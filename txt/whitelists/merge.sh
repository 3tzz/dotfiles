#!/bin/bash

# Init where
# SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Input files
LTEX_PL="/home/freetzz/.dotfiles/txt/whitelists/ltex.dictionary.pl-PL.txt"
# LTEX_EN="/home/freetzz/.dotfiles/txt/whitelists/ltex.dictionary.en-US.txt"
SPELL_VIM="/home/freetzz/.dotfiles/txt/whitelists/global.add"

# Append words

cat ${SPELL_VIM} >>${LTEX_PL}
