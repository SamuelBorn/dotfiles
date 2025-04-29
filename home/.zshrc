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
alias g="lazygit"
alias n="nvim"
alias o="xdg-open"
alias cd="z"
alias up="kitten @ launch flatpak update -y; sudo dnf upgrade -y"
alias di="sudo dnf install"
alias dr="sudo dnf remove"
alias ds="dnf search"
alias dp="dnf provides"
alias fpi="flatpak install"
alias fpr="flatpak remove --delete-data"
alias fps="flatpak search"
alias fpl="flatpak list"
alias fd="fd --hidden"
alias ls="ls --color=auto -1"
alias ll="ls -Ahl"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tree="tree -C -L 4"
alias venv="source venv/bin/activate || python -m venv venv && source venv/bin/activate"
alias restow="(cd ~/Repos/dotfiles && stow -vt ~ home)"
alias pdflatex="texfot pdflatex"
function md() { mkdir "$1" && cd "$1" }
