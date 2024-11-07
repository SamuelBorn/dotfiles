# Powerlevel10k prompt
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
source ~/.config/p10k/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/p10k/.p10k.zsh

# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
setopt no_case_glob

# Plugins
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# History options
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_all_dups

# Useful Aliases
alias g="lazygit"
alias i="sudo dnf install"
alias u="flatpak update -y > /dev/null & sudo dnf upgrade -y"
alias cd="z"
alias fd="fd --hidden"
alias ls="ls --color=auto -1"
alias ll="ls -Ahl"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tree="eza --tree --all --git-ignore --git --level=4"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
alias restow="cd ~/Repos/dotfiles/home && stow --target=$HOME . && cd -"
alias pdflatex="texfot pdflatex"
function n() { nvim "${1:-"$(fzf)"}" }
function o() { xdg-open "${1:-"$(fzf)"}" 2> /dev/null}
function md() { mkdir "$1" && cd "$1" }

# Path
path+=(/var/lib/flatpak/exports/bin)
path+=(~/.cargo/bin)
path+=(~/.local/bin)
export PATH

# Environment variables
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# Fix zsh movement in terminal in Terminal - see key codes with "cat"
WORDCHARS={}
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
