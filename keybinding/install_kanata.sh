#!/usr/bin/env bash

BASE_DIR=$(dirname $(realpath $0))

cargo install kanata --features cmd

sudo usermod -aG input,uinput $USER

sudo ln -s -f "${BASE_DIR}"/keybinding/99-input.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules
sudo udevadm trigger

mkdir -p ~/.config/systemd/user

sed -i 's|ExecStart=|ExecStart=${BASE_DIR}/.cargo/bin/kanata --cfg ${BASE_DIR}/.dotfiles/keybinding/kanata.kbd|' "${BASE_DIR}"/keybinding/kanata.service
sudo cp "${BASE_DIR}"/keybinding/kanata.service ~/.config/systemd/user

echo "Now you should relog current user so new group membership applies. Best approach is to restart system."
