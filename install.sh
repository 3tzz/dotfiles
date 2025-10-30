#!/usr/bin/env bash

BASE_DIR=$(dirname $(realpath $0))

# System update
sudo apt update && apt full-upgrade -y

# Essential tools
sudo apt install -y wget curl rsync man tldr btop make cmake unzip

# Rust & Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "${HOME}"/.cargo/env

# Git
sudo apt install -y git tig git-delta
ln -s -f "${BASE_DIR}"/git/.gitconfig ~

# SSH
sudo apt install openssh-client openssh-server -y
ln -s -f "${BASE_DIR}"/ssh/config ~/.ssh

# Text Editor
sudo apt install vim -y
ln -s -f "${BASE_DIR}"/vim/.vimrc ~

cd "${BASE_DIR}"/nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

cd $BASE_DIR

# File Search Tools
sudo apt install ripgrep fd-find zoxide -y
mkdir -p ~/.config/ripgrep
ln -s -f "${BASE_DIR}"/ripgrep/rc ~/.config/ripgrep

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# File Explorator
# sudo sudo apt install ranger tree -y
sudo apt install ffmpeg 7zip jq poppler-utils imagemagick

cargo install --force yazi-build

# Terminal multiplexer
sudo apt install tmux -y
ln -s -f "${BASE_DIR}"/tmux/.tmux.conf ~

# Python essentials
sudo apt install -y python3-venv python3-pip python3-dev python3-setuptools pipx

# Shell init
sudo apt install -y eza
sudo apt install -y shellcheck shfmt

# Shell zsh
sudo apt install -y zsh

#oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s
export PATH=$PATH:~/.local/bin
oh-my-posh font install meslo

# # oh-my-posh
# sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# sudo chmod +x /usr/local/bin/oh-my-posh

wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -qO install_oh_my_zsh.sh
sh install_oh_my_zsh.sh --unattended
rm install_oh_my_zsh.sh

ZSH_CUSTOM=~/.oh-my-zsh/custom

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions                       #autosuggestions
git clone https://github.com/clarketm/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions                                #completions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting #syntax highlighting
git clone https://github.com/Aloxaf/fzf-tab.git $ZSH_CUSTOM/plugins/fzf-tab                                              #fzf tab
git clone https://github.com/junegunn/fzf-git.sh

ln -s -f "${BASE_DIR}"/zsh/.zshrc ~

# Change shell
chsh -s "$(which zsh)"
