# Keyboard uses FN keys by default, not the multimedia keys
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo "options hid_apple fnmode=2" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo dracut --regenerate-all --force  # sudo update-initramfs -u

# Set boot theme
sudo plymouth-set-default-theme details -R

# Mouse hotkeys switch workspaces
ln -s ~/Repos/dotfiles/input-remapper-2 ~/.config
sudo dnf install -y input-remapper
sudo systemctl enable --now input-remapper
