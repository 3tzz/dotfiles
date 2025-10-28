# dotfiles

A collection of personal configuration files (dotfiles) for Linux, including shell, editor, and terminal setup.

This repository helps you quickly set up a consistent environment across machines.

---

## Features

### Essential Tools

- `wget` – Download files from the internet via HTTP, HTTPS, or FTP.
- `curl` – Transfer data to/from servers; supports many protocols and APIs.
- `rsync` – Fast file synchronization between local and remote locations.
- `man` – Shows the manual (documentation) for commands.
- `tldr` – Simplified, example-based help pages for common commands.
- `btop` – Resource monitor (CPU, memory, disks, network) with a nice interface.
- `make` – Automates building and compiling projects from Makefiles.
- `cmake` – Cross-platform build system generator; prepares projects for compilation.

### Version Control

- `git` – Track and manage code changes.
- `tig` – Terminal Git interface.
- `git diff` / `git show` – Colorful, readable Git diffs.

### SSH & Authentication

- `openssh` – Secure shell for remote login and file transfer.
- `authy` – Two-factor authentication app for added account security.

### Text Editor

- `vim` – Classic terminal text editor.
- `nvim` – Modern, improved version of Vim with extra features.

### File Search Tools

- `rg` – Fast search tool for text in files (ripgrep).
- `fd` – Simple, fast alternative to `find`.
- `fzf` – Ctrl+R (command history) Ctrl+T (file explorer)
- `z` – Jump to frequently used directories quickly.

### File Explorer

- `yazi` – Fast terminal file explorer with zoxide compatibility. TODO to add

### Terminal Multiplexer

- `tmux` – Terminal session manager for splitting, detaching, and multitasking.TODO to add

### Python Essentials

- `python3` – Python 3 interpreter.
- `pip` / `pipx` – Python package managers; `pipx` installs standalone applications.
- `python3-dev` – Development headers for building Python extensions.
- `venv` – Tool for creating isolated Python environments.
- `setuptools` – Python package for building and distributing projects.

### Shell

- `eza` – Modern replacement for `ls` with colors and icons.
- `shellcheck` – Linter for shell scripts to catch errors and improve code quality.
- `shfmt` – Formatter for shell scripts to enforce consistent style.
- `zsh`

  - `Nerd fonts`
  - `Oh-My-Zsh`
  - `Oh-My-Posh`

  * Zsh with Oh-My-Zsh, Powerlevel10k theme, plugins (autosuggestions, syntax highlighting, fzf tab completion)

### **Fonts & Themes**: Nerd Fonts, Oh-My-Posh

---

## Installation

Clone the repository:

```bash
git clone https://github.com/3tzz/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

