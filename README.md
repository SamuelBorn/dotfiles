# Dotfiles and Post-install Scripts for Fedora

The included post-install script streamlines the setup process by installing essential software and configuring various options, such as config files (notably `nvim`), themes, shortcuts, and fonts.

Just grab the dotfiles you need or run the scripts below to get the whole setup.

- **1-dnf.sh**: Configure DNF options, install crucial packages, and reboot.
- **2-flatpak.sh**: Install commonly used Flatpaks to enhance your Fedora experience.
- **3-main.sh**: Set options, configure shortcuts, and more.
- **4-desktop.sh**: Tailored for my home use case; you might not need this file.

## Full Setup Instructions

1. Clone this repository to your local machine:

   ```bash
   git clone --recursive https://github.com/SamuelBorn/dotfiles.git ~/Repos/dotfiles
   ```

1. Navigate to the cloned directory:

   ```bash
   cd ~/Repos/dotfiles
   ```

1. Adept the scripts to fit four own needs. Delete stuff, add stuff, change stuff.

1. Execute the scripts in the specified order:

   ```bash
   ./1-dnf.sh
   ./2-flatpak.sh
   ./3-main.sh
   ./4-desktop.sh   # (very optional: personal settings)
   ```
