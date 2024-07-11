# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Set history options
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups

# Plugins
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Useful Aliases
alias o="xdg-open"
alias cd="z"
alias ..="cd .."
alias lg="lazygit"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
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
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Git Prompt
function gitBranch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

function gitUpstreamPosition() {
    local commitCount=$(git rev-list --count --left-right @{upstream}...HEAD 2> /dev/null)
    if [ -n "$commitCount" ]; then
       local behindCount=$(echo "$commitCount" | cut -f1)
       local aheadCount=$(echo "$commitCount" | cut -f2)
       if [ "$behindCount" != "0" ]; then echo " %F{red}↓${behindCount}%f"; fi
       if [ "$aheadCount" != "0" ]; then echo " %F{red}↑${aheadCount}%f"; fi
    fi
}

function gitStatus() {
    local gitstatus=$(git status --porcelain --ignore-submodules=dirty 2> /dev/null)
    if [ -n "$gitstatus" ]; then
         local staged=$(echo "$gitstatus" | grep '^[^? ]' | wc -l)
         local modified=$(echo "$gitstatus" | grep '^.[^? ]' | wc -l)
         local untracked=$(echo "$gitstatus" | grep '^[?][?]' | wc -l)
         if [ "$staged" != "0" ]; then echo " %F{green}+$staged%f"; fi
         if [ "$modified" != "0" ]; then echo " %F{yellow}!$modified%f"; fi
         if [ "$untracked" != "0" ]; then echo " %F{blue}?$untracked%f"; fi
    fi
}

setopt prompt_subst
PROMPT="%F{blue}%(5~|…/%4~|%~)%f ❯ "
RPROMPT="\$(gitBranch)\$(gitUpstreamPosition)\$(gitStatus)"
