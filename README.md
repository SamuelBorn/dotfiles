# Dotfiles and Post-install Scripts for Fedora

The included post-install script streamlines the setup process by installing essential software and configuring various options, such as config files, themes, shortcuts, and fonts.
Feel free to customize the script by commenting out sections that are not relevant to your needs.

Just grab the dotfiles you need or run the scripts below to get the whole setup.

- **1-dnf-setup.sh**: Configure DNF options, install crucial packages, and reboot.
- **2-flatpak-install.sh**: Install commonly used Flatpaks to enhance your Fedora experience.
- **3-config-options.sh**: Set options, configure shortcuts, and more.
- **4-home-specific.sh**: Tailored for my home use case; you might not need this file.

## Full Setup Instructions

1. Clone this repository to your local machine:

   ```bash
   git clone --recursive https://github.com/SamuelBorn/dotfiles.git
   ```

1. Navigate to the cloned directory:

   ```bash
   cd dotfiles-fedora
   ```

1. Adept the scripts to fit four own needs. Delete stuff, add stuff, change stuff.

1. Execute the scripts in the specified order:

   ```bash
   ./1-dnf.sh
   ./2-flatpak.sh
   ./3-main.sh
   ./4-desktop.sh   # (optional)
   ```
