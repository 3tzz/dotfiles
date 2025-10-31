#!/usr/bin/env bash

BASE_DIR=$(dirname $(realpath $0))

cargo install kanata

sudo usermod -aG input,uinput $USER

sudo ln -s -f "${BASE_DIR}"/keybindings/99-input.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules && sudo udevadm trigger

mkdir -p ~/.config/systemd/user
sudo cp "${BASE_DIR}"/keybindings/kanata.service ~/.config/systemd/user/kanata.service

echo "Now you should relog current user so new group membership applies."
