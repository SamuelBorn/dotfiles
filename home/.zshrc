# Powerlevel10k configuration
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Private configuration
source ~/.config/zsh_private

# Case Insensitive Autocompletion + Other Options
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
setopt no_case_glob
setopt share_history
setopt hist_ignore_all_dups

# Plugins
source <(zoxide init zsh)
source <(fzf --zsh)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf-zoxide integration
function fzf_zoxide() { 
    LBUFFER+=$(zoxide query --list | fzf --reverse --height=40%)
    zle reset-prompt
}
zle -N fzf_zoxide

# Keybindings
bindkey -e
bindkey '^o' fzf_zoxide
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

# Useful Aliases
alias n="nvim"
alias g="lazygit"
alias o="xdg-open"
alias cd="z"
alias rm="rm -I"
alias fd="fd --hidden --no-ignore"
alias ls="ls --color=auto -1"
alias ll="ls -Ahl"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tree="tree -C -L 4"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
alias restow="(cd ~/Repos/dotfiles && stow -vt ~ home)"
function md() { mkdir "$1" && cd "$1" }

# Package Management Aliases
alias up="kitten @ launch flatpak update -y; sudo dnf upgrade -y"
alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"
alias dnfs="dnf search"
alias dnfp="dnf provides"
alias fpi="flatpak install"
alias fpr="flatpak remove --delete-data"
alias fps="flatpak search"
alias fpl="flatpak list"

# git aliases
alias gs="git status --short"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit --message"
alias gca="git commit --all --message"
alias gsw="git switch"
alias gcb="git switch --create"
alias gd="git diff"
alias gl="git log --graph --decorate --oneline"
alias gp="git pull"
alias gP="git push"
alias gfP="git push --force-with-lease"
alias gre="git reset --hard HEAD"

# Bind arrow keys to search history based on the typed command prefix.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
