echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=2' | sudo tee -a /etc/dnf/dnf.conf

# Updates
sudo dnf upgrade -y

sudo dnf install -y \
    gnome-tweaks \
    tldr \
    akmod-nvidia \
    hunspell-de \
    distrobox \
    htop \
    neofetch \
    gnome-pomodoro \
    flameshot \
    adw-gtk3-theme \
    neovim \
    xclip \
    ripgrep \
    zsh \
    autojump-zsh \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    util-linux-user

reboot
