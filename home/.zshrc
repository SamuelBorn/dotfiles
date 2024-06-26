# p10k prompt 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.config/p10k/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/p10k/p10k.zsh

# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Set history options
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Plugins
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-accept

# Useful Aliases
alias o="xdg-open"
alias cd="z"
alias ..="cd .."
alias ls="eza -A"
alias ll="eza -Al"
alias lg="lazygit"
alias venv="source .venv/bin/activate || virtualenv .venv && source .venv/bin/activate"
alias up="gnome-terminal --tab -- flatpak update -y && sudo dnf upgrade -y"
alias dnf="sudo dnf"
alias restow="cd ~/Repos/dotfiles/home && stow --target=$HOME . && cd -"
function f/(){sudo find / -iname "*$1*"}
function f.(){sudo find . -iname "*$1*"}
function md(){mkdir -p "$1" && cd "$1"}

# Path
path+=(/var/lib/flatpak/exports/bin)
path+=(~/.cargo/bin)
export PATH

# Environment variables 
export VISUAL=nvim
export EDITOR=nvim

# Fix zsh movement in terminal in Terminal - see key codes with "cat"
export WORDCHARS={}
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
