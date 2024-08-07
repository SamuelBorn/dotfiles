# powerlevel10k prompt
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
source ~/.config/p10k/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/p10k/.p10k.zsh

# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Set history options
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_all_dups

# Plugins
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Useful Aliases
alias o="xdg-open"
alias cd="z"
alias ll="ls -Ahl"
alias ..="cd .."
alias lg="lazygit"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
alias up="gnome-terminal --tab -- flatpak update -y && sudo dnf upgrade -y"
alias dnf="sudo dnf"
alias restow="cd ~/Repos/dotfiles/home && stow --target=$HOME . && cd -"
function f/(){sudo find / -iname "*$1*"}
function f.(){sudo find . -iname "*$1*"}
function md(){mkdir "$1" && cd "$1"}
function pdf(){find . -name "*.pdf" | parallel pdfgrep --color always -Hni  "$1"}

# Path
path+=(/var/lib/flatpak/exports/bin)
path+=(~/.cargo/bin)
path+=(~/.local/bin)
export PATH

# Environment variables 
export EDITOR=nvim

# Fix zsh movement in terminal in Terminal - see key codes with "cat"
WORDCHARS={}
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
