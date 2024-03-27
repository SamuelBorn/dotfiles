echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=4' | sudo tee -a /etc/dnf/dnf.conf

# Updates
sudo dnf upgrade -y

sudo dnf install -y \
	adw-gtk3-theme \
	akmod-nvidia \
	cmake \
	flameshot \
	g++ \ 
	gcc \
	gnome-pomodoro \
	gnome-tweaks \
	htop \
	hunspell-de \
	neofetch \
	neovim \
	nodejs \ 
	ripgrep \
	tldr \
	trash-cli \
	util-linux \
	xclip \
	zsh \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
    zoxide \

reboot
