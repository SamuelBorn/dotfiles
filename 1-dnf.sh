echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=4' | sudo tee -a /etc/dnf/dnf.conf

# Updates
sudo dnf upgrade -y

sudo dnf install -y \
    adw-gtk3-theme \
    akmod-nvidia \
    autojump-zsh \
    flameshot \
    gnome-pomodoro \
    gnome-tweaks \
    htop \
    hunspell-de \
    neofetch \
    neovim \
    ripgrep \
    tldr \
    trash-cli \
    util-linux-user \
    xclip \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting 

reboot
