flatpak config --set extra-languages "de"

# Regenerate list: flatpak list --app --columns=application | sed 's/$/ \\/' | sort 
flatpak install -y \
org.gtk.Gtk3theme.adw-gtk3 \
org.gtk.Gtk3theme.adw-gtk3-dark \
\
com.belmoussaoui.Obfuscate \
com.discordapp.Discord \
com.dropbox.Client \
com.github.finefindus.eyedropper \
com.github.flxzt.rnote \
com.github.jeromerobert.pdfarranger \
com.github.johnfactotum.Foliate \
com.github.micahflee.torbrowser-launcher \
com.github.tchx84.Flatseal \
com.google.Chrome \
com.mattjakeman.ExtensionManager \
com.spotify.Client \
com.ticktick.TickTick \
io.github.celluloid_player.Celluloid \
io.github.mimbrero.WhatsAppDesktop \
md.obsidian.Obsidian \
net.ankiweb.Anki \
org.gimp.GIMP \
org.gnome.Geary \
org.gnome.SoundRecorder \
org.kde.okular \
org.signal.Signal \
us.zoom.Zoom 

