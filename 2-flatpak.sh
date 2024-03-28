flatpak config --set extra-languages "de"

# Regenerate list: flatpak list --app --columns=application | sed 's/$/ \\/' | sort
flatpak install -y \
	org.gtk.Gtk3theme.adw-gtk3 \
	org.gtk.Gtk3theme.adw-gtk3-dark \
	\
	com.discordapp.Discord \
	com.dropbox.Client \
	com.github.eneshecan.WhatsAppForLinux \
	com.github.flxzt.rnote \
	com.github.jeromerobert.pdfarranger \
	com.github.johnfactotum.Foliate \
	com.github.tchx84.Flatseal \
	com.google.Chrome \
	com.mattjakeman.ExtensionManager \
	com.nextcloud.desktopclient.nextcloud \
	com.spotify.Client \
	io.github.celluloid_player.Celluloid \
	md.obsidian.Obsidian \
	net.ankiweb.Anki \
	org.gimp.GIMP \
	org.gnome.Geary \
	org.kde.okular \
	org.signal.Signal \
	org.torproject.torbrowser-launcher
