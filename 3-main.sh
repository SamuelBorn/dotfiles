# No password sudo
echo 'born ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/born

# Custom Shortcuts
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "['<Super>c']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys suspend "['<Super>F1']"  
gsettings set org.gnome.settings-daemon.plugins.media-keys power "['<Super>Delete']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/logout/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ name 'Launch Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ binding '<Super>Return'

gsettings set org.gnome.shell.keybindings show-screenshot-ui '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ name 'Take Screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ binding 'Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/logout/ name 'Log out'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/logout/ command 'gnome-session-quit --logout'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/logout/ binding '<Super>F2'

# Open terminal here shortcut
echo 'gnome-terminal' > .local/share/nautilus/scripts/Terminal
chmod +x .local/share/nautilus/scripts/Terminal 
echo 'F12 Terminal' > .config/nautilus/scripts-accels         

# Nerd Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir ~/.local/share/fonts/JetBrainsMono
tar -xf JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMono
rm JetBrainsMono.tar.xz
fc-cache -f
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 11'

# ZSH setup
ln -s ~/Repos/dotfiles/.zshrc ~/.zshrc
chsh -s /bin/zsh
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ~/Repos/powerlevel10k

# Automatic updates
systemctl enable --now dnf-automatic-install.timer

# Theme GTK 3 apps 
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Neovim
git clone --depth 1 https://github.com/NvChad/NvChad ~/.config/nvim 

# JetBrains Toolbox
wget -cO jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf jetbrains-toolbox.tar.gz
DIR=$(find . -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1)
cd $DIR
./jetbrains-toolbox
cd ..
rm -r $DIR
rm jetbrains-toolbox.tar.gz

# GitHub
ssh-keygen -t ed25519 -C "samuelborn@outlook.de"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
xdg-open "https://github.com/settings/keys"
