# Read in user data
read -p "Please enter your email address: " email

# No password sudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

# Custom Shortcuts
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "['<Super>c']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>f']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gsettings set org.gnome.settings-daemon.plugins.media-keys help "[]"
gsettings set org.gnome.settings-daemon.plugins.media-keys suspend "['<Super>F1']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/power-off/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ name 'Launch Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ command 'kitty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/ binding '<Super>Return'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/power-off/ name 'Power off'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/power-off/ command 'shutdown now'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/power-off/ binding '<Super>F2'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ name 'Take Screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ command 'script --command "QT_QPA_PLATFORM=wayland flameshot gui" /dev/null'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot/ binding 'Print'
gsettings set org.gnome.shell.keybindings show-screenshot-ui '[]'

# Install dotfiles
cd ~/Repos/dotfiles/home
stow --target=$HOME .

# Nerd Font
mkdir -p ~/.local/share/fonts/JetBrainsMono
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz | tar -xJ -C ~/.local/share/fonts/JetBrainsMono
fc-cache -f
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 11'

# Change default shell to zsh
chsh --shell /bin/zsh

# GitHub add ssh key and default sign commits
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
xdg-open "https://github.com/settings/keys"

# Git setup with signing
git config --global user.name "$(getent passwd $USER | cut -d ':' -f 5)"
git config --global user.email "$email"
git config --global core.editor nvim
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
git config --global pull.rebase true
git config --global rebase.autoStash true

# Disable alert bell
gsettings set org.gnome.desktop.wm.preferences audible-bell false

# Disable logout prompt
gsettings set org.gnome.SessionManager logout-prompt false

# Theme GTK 3 apps
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Input remapping: used for esc-caps and mouse buttons
sudo dnf install -y input-remapper
sudo systemctl enable --now input-remapper
