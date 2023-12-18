# p10k instant-prompt - stay at top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set history options
HISTFILE=~/.config/zsh_histfile
HISTSIZE=10000
SAVEHIST=10000

# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

# Case Insensitive Autocompletion
autoload -Uz compinit && compinit -d ~/.config/.zcompdump
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Useful Aliases
alias lg="lazygit"
alias venv="source .venv/bin/activate || virtualenv .venv && source .venv/bin/activate"
alias ls="ls -Ah --color=auto"
alias ll="ls -lh --color=auto"
alias up="gnome-terminal --tab -- flatpak update -y && sudo dnf upgrade -y"
alias dnf="sudo dnf"
function md(){mkdir -p "$1" && cd "$1"}

# Path
path+=("/var/lib/flatpak/exports/bin")
export PATH

# Environment variables 
export VISUAL=nvim
export EDITOR=nvim

# Fix zsh movement in terminal in Terminal - see codes with "cat"
export WORDCHARS={}
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# p10k loading - stay at bot
source ~/Repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/Repos/dotfiles/p10k.zsh

