#!/usr/bin/env bash

BASE_DIR=$(dirname $(realpath $0))

# System update
apt update && apt upgrade -y

# Essential tools
apt install -y wget curl rsync man tldr btop make cmake

# Rust & Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "${HOME}"/.cargo/env

# Git
apt install -y git tig git-delta
ln -s -f "${BASE_DIR}"/git/.gitconfig ~

# SSH
apt install openssh-client openssh-server -y
ln -s -f "${BASE_DIR}"/ssh/config ~/.ssh

# Text Editor
apt install vim neovim -y
ln -s -f "${BASE_DIR}"/vim/.vimrc ~

# File Search Tools
apt install ripgrep fd-find zoxide -y
mkdir -p ~/.config/ripgrep
ln -s -f "${BASE_DIR}"/ripgrep/rc ~/.config/ripgrep

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# File explorator
# sudo apt install ranger tree -y
apt install ffmpeg 7zip jq poppler-utils fzf imagemagick

cd yazi || {
  echo "Failed to change directory to yazi."
}
git clone --depth 1 https://github.com/sxyazi/yazi.git
cd yazi || {
  echo "Failed to change directory to yazi. Clone repo from https://github.com/sxyazi/yazi and make sure that u have rust in your setup."
}
cargo build --release --locked
mv target/release/yazi /usr/local/bin/ # if somthing wrong u can use mv instead of ln
mv target/release/ya /usr/local/bin/   # if somthing wrong u can use mv instead of ln
cd ..
rm -rf yazi

# Terminal multiplexer

# Python essentials
apt install -y python3-venv python3-pip python3-dev python3-setuptools pipx

# Shell init
apt install -y eza
apt install -y shellcheck shfmt

# Shell zsh
apt install -y zsh

# ln -s -f "${BASE_DIR}"/zsh/.zshrc ~

# Change shell
# chsh -s "$(which zsh)"
