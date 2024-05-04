echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=4' | sudo tee -a /etc/dnf/dnf.conf

# Enable RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264

# TUI based git client
sudo dnf copr enable atim/lazygit -y

# Updates
sudo dnf upgrade -y

# Nvidia and Multimedia Configuration
sudo dnf install akmod-nvidia nvidia-vaapi-driver
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Useful packages
sudo dnf install -y \
	adw-gtk3-theme \
	cmake \
	flameshot \
	g++ \
	gcc \
	gnome-pomodoro \
	gnome-tweaks \
	htop \
	hunspell-de \
	lazygit \
	fastfetch \
	neovim \
    nextcloud-client \
	nodejs \
	ripgrep \
	stow \
	tldr \
	trash-cli \
	util-linux \
	xclip \
	zoxide \
	zsh \
	zsh-autosuggestions \
	zsh-syntax-highlighting

reboot
