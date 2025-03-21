# Powerlevel10k configuration
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
setopt no_case_glob

# Stuff that should not be in git
source ~/.config/zsh_private

# Plugins
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf + zoxide integration
function fzf_zoxide() { LBUFFER+=$(zoxide query --list | fzf) }
zle -N fzf_zoxide
bindkey '^o' fzf_zoxide

# History options
HISTFILE=~/.config/zsh_histfile
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_all_dups

# Useful Aliases
alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"
alias dnfs="dnf search"
alias dnfp="dnf provides"
alias fpi="flatpak install"
alias fpr="flatpak remove --delete-data"
alias fps="flatpak search"
alias fpl="flatpak list"
alias up="kitten @ launch flatpak update -y; sudo dnf upgrade -y"

alias g="lazygit"
alias n="nvim"
alias o="xdg-open"
alias cd="z"
alias fd="fd --hidden"
alias ls="ls --color=auto -1"
alias ll="ls -Ahl"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tree="tree -C -L 4"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
alias restow="(cd ~/Repos/dotfiles && stow -vt ~ home)"
alias pdflatex="texfot pdflatex"
function md() { mkdir "$1" && cd "$1" }

# Path
path+=(~/.cargo/bin)
path+=(~/.local/bin)
path+=(/usr/lib64/openmpi/bin)
export PATH

# Environment variables
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/born/Nextcloud/ws2425/Master/Code/dependencies/KaHIP:$LD_LIBRARY_PATH
export FZF_DEFAULT_OPTS="
--color=bg+:#363847
--color=spinner:#f5e0dc
--color=hl:#f38ba8
--color=fg:#cdd6f4
--color=header:#f38ba8
--color=info:#cba6f7
--color=pointer:#f5e0dc
--color=marker:#b4befe
--color=fg+:#cdd6f4
--color=prompt:#cba6f7
--color=hl+:#f38ba8
--color=selected-bg:#45475a
--color=border:#313244
--color=label:#cdd6f4"

# Fix zsh movement in terminal in Terminal - see key codes with "cat"
WORDCHARS={}
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey -e
