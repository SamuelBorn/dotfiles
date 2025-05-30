path+=(~/.cargo/bin)
path+=(~/.local/bin)
path+=(/usr/lib64/openmpi/bin)
export PATH

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export WORDCHAR={}
export HISTFILE=~/.config/zsh_histfile
export HISTSIZE=100000
export SAVEHIST=100000
export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
export NVD_BACKEND=direct

export LD_LIBRARY_PATH="\
/usr/lib64/openmpi/lib:\
/usr/local/lib64:\
$HOME/Nextcloud/ws2425/Master/Code/dependencies/KaHIP:\
$LD_LIBRARY_PATH"

export FZF_DEFAULT_OPTS="\
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
--color=border:#313244"
