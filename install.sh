#!/usr/bin/env bash

BASE_DIR=$(dirname $(realpath $0))

# System update
apt update && apt upgrade -y

# Essential tools
apt install -y wget curl rsync man tldr btop make cmake

# Git
apt install -y git tig git-delta
ln -s -f "${BASE_DIR}"/git/.gitconfig ~

# SSH
apt install openssh-client openssh-server -y
ln -s -f "${BASE_DIR}"/ssh/config ~/.ssh

# Text Editor
apt install vim neovim -y
ln -s -f "${BASE_DIR}"/vim/.vimrc ~

# Searchers and finders
apt install ripgrep fd-find zoxide -y
mkdir -p ~/.config/ripgrep
ln -s -f "${BASE_DIR}"/ripgrep/rc ~/.config/ripgrep

# File explorator

# Terminal multiplexer

# Python essentials
apt install -y python3-venv python3-pip python3-dev python3-setuptools pipx

# Authenticator
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.ente.auth

# Shell init
apt install -y eza
apt install -y shellcheck shfmt

# Shell zsh
apt install -y zsh

# Ctrl+R (command history) Ctrl+T (file explorer)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# ln -s -f "${BASE_DIR}"/zsh/.zshrc ~

# Change shell
# chsh -s "$(which zsh)"
