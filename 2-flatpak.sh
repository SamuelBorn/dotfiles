flatpak config --set extra-languages "de"

flatpak remote-delete fedora
flatpak remote-delete fedora-testing

# Regenerate list: flatpak list --app --columns=application | sed 's/$/ \\/' | sort
flatpak install flathub -y \
	org.gtk.Gtk3theme.adw-gtk3 \
	org.gtk.Gtk3theme.adw-gtk3-dark \
	\
	com.discordapp.Discord \
	com.github.jeromerobert.pdfarranger \
	com.github.johnfactotum.Foliate \
	com.github.tchx84.Flatseal \
	com.google.Chrome \
	com.mattjakeman.ExtensionManager \
	com.spotify.Client \
	md.obsidian.Obsidian \
	net.ankiweb.Anki \
	org.gimp.GIMP \
	org.gnome.Geary \
	org.signal.Signal \
	org.torproject.torbrowser-launcher
