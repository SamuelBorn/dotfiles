# Input remapping: used for esc-caps and mouse buttons
sudo dnf install -y input-remapper
sudo systemctl enable --now input-remapper

# Keyboard uses FN keys by default, not the multimedia keys
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo "options hid_apple fnmode=2" | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo dracut --regenerate-all --force  # sudo update-initramfs -u

# Set boot theme
sudo plymouth-set-default-theme details -R

# disable acpi wakeup devices so suspend does not wake immediately
echo '@reboot sudo sh -c "for device in \$(awk \"/\\*enabled/ {print \$1}\" /proc/acpi/wakeup); do echo \$device > /proc/acpi/wakeup; done"' | crontab -

# Create and apply a udev rule to ensure the keyboard is recognized on boot.
echo 'ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="3a3c", ATTRS{idProduct}=="0002", TEST=="power/control", ATTR{power/control}="on"' | sudo tee /etc/udev/rules.d/90-qmk-keyboard.rules
