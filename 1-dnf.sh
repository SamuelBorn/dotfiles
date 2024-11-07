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
sudo dnf install -y akmod-nvidia nvidia-vaapi-driver libva-utils vdpauinfo
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Useful packages
sudo dnf install -y \
    adw-gtk3-theme \
    btop \
    cloc \
    cmake \
    fastfetch \
    fd \
    flameshot \
    g++ \
    gnome-pomodoro \
    gnome-shell-extension-caffeine \
    gnome-tweaks \
    hunspell-de \
    kitty \
    lazygit \
    mpv \
    neovim \
    nextcloud-client \
    npm \
    prename \
    ripgrep \
    stow \
    tldr \
    trash-cli \
    util-linux \
    wl-clipboard \
    zoxide \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting

reboot
