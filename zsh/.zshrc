export XDG_CONFIG_HOME=~/.dotfiles

export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/rc
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/ltex-ls/bin"

HISTSIZE=1000000
SAVEHIST=1000000

# Path to your oh-my-zsh installation (first assume that we start from docker)
[ -d /root/.oh-my-zsh ] && export ZSH=/root/.oh-my-zsh
[ -d ${HOME}/.oh-my-zsh ] && export ZSH=${HOME}/.oh-my-zsh

DEFAULT_USER="${USER}"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git colored-man-pages command-not-found history history-substring-search dircycle dirhistory fasd docker vi-mode last-working-dir zsh-autosuggestions fast-syntax-highlighting zsh-completions fzf-tab)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"

export LANG=en_US.UTF-8
export EDITOR='nvim'
export VISUAL='nvim'

# eval "$(fasd --init auto)"
eval "$(zoxide init zsh)"

# Yazi Setup
export ZOXIDE_DB="$HOME/.local/share/zoxide/zo.db"
export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
  echo $cwd
  # zoxide add $cwd
	rm -f -- "$tmp"
}

alias stats='sort | uniq -c | sort -n'

alias fd='fd -I -L' # by default fd doesn't search gitignore files

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source ~/.dotfiles/fzf-git.sh/fzf-git.sh
source $HOME/.cargo/env # RUST setup

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
eval "$(oh-my-posh init zsh --config ~/.dotfiles/ohmyposh/catppuccin_frappe.omp.json)"

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
alias htop="htop -d 50"
alias nvidia-smi="nvidia-smi -l"

alias gs="git status"
alias ts="tig status"
alias gl="git log --all --oneline --graph --decorate"

alias la="ls -lAh"
alias hc="history -c"
alias ssh-forget="rm -f ~/.ssh/{authorized_keys,known_hosts}"
alias vim="nvim"
alias htop="btop"
alias top="btop"
alias z="fasd_cd -d"
alias fd="fdfind"
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias clip-history="~/.local/share/gpaste/parse_history.sh"
alias authente="flatpak run io.ente.auth"

function cheat() { curl cheat.sh/$1 }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.dotfiles/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
