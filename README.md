# Dotfiles and Post-install Scripts for Fedora

## Overview

The included post-install script streamlines the setup process by installing essential software and configuring various options, such as themes, shortcuts, and fonts.
Feel free to customize the script by commenting out sections that are not relevant to your needs.

1. **01-dnf-setup.sh**: Configure DNF options, install crucial packages, and reboot.
1. **02-flatpak-install.sh**: Install commonly used Flatpaks to enhance your Fedora experience.
1. **03-config-options.sh**: Set options, configure shortcuts, and more.
1. **04-home-specific.sh**: Tailored for my home use case; you might not need this file.

## Usage Instructions

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/dotfiles-fedora.git
   ```

1. Navigate to the cloned directory:

   ```bash
   cd dotfiles-fedora
   ```

1. Adept the scripts to fit four own needs. Delete stuff, add stuff, change stuff.

1. Execute the scripts in the specified order:

   ```bash
   ./01-dnf.sh
   ./02-flatpak.sh
   ./03-main.sh
   ./04-desktop.sh   # (optional)
   ```
