#!/bin/bash

_IsoConfig() {
    local install_mode="$1" 

    pacman -S --noconfirm --needed \
    automake autoconf autoconf-archive gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 \
    libxcomposite xorg-xinput libxrender dconf libnotify python-cairo python-configobj dbus-python python-psutil pixman glib \
    pkgconf glib2 libgtop vala valabind webkit2gtk go gvfs wayland wayland-protocols cairo figlet pango json-glib libsoup seatd \
    libxkbcommon xcb-util-wm xorg-xwayland btop htop libnl libinput libliftoff libdisplay-info cpio tomlplusplus miniupnpc \
    nodejs gcc-libs perl python glibc gtk2 pv gtk3 gtk4 parted plymouth boost-libs bzip2 icu zlib zstd gnome-disk-utility \
    filemanager-actions isocodes openssl polkit-kde-agent hyprland xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
    xdg-desktop-portal-hyprland qt5-wayland qt6-wayland xdg-user-dirs xdg-user-dirs-gtk xdg-utils kvantum geany geany-plugins mpv \
    libnewt vlc gparted notepadqq kvantum dunst mako alsa-lib jq attr bat bat-extras nwg-look pipwire wireplumber \
    udisks2 udiskie2 fcitx5-gtk git curl wget wgetpaste fcitx-qt5 fcitx-configtool font-manager nodejs-emojione contractor \
    mkinitcpio-utils mkinitcpio-archiso mkinitcpio-utils nodejs-yaml archiso archinstall ts-node aalib thunar jansson ascii \
    jp2a cliphist cpio ncurses dialog clonezilla i2pd gtkd tk python-pipx pantheon-mail pantheon-code ffmpeg ffmpegthumbnailer \
    libpng thunar-archive-plugin python-pip zip tumbler thunar-media-tags-plugin unzip base-devel coreutils clipgrab thunar-volman \
    grep pacman util-linux gmp bluez-libs bluez blueman mpfr gawk bash bash-completion gawk fakeroot pacman-contrib arch-install-scripts \
    archlinux-contrib ario colord-gtk-common colord-gtk networkmanager bluefish nm-connection-editor network-manager-applet granite7 libsoup3 \
    player gst-plugin-gtk gtk-engine-murrine gtk-layer-shell libnma-gtk4 libdbusmenu-gtk3 marker tilix terminator bats typescript playerctl \
    brightnessctl gjs pavucontrol libayatana-appindicator alsa-lib coffeescript multilib-devel gsettings-desktop-schemas coffeescript \
    qt5-base qt6-base gtksourceview3 hyprpaper imv pulseaudio kanshi layer-shell-qt libdecor swaybg swayidle wlsunset zenity yad spotify-launcher \
    sddm firefox kitty wofi alacritty squashfs-tools

    # Activate xdg-user-dirs
    xdg-user-dirs-update
   
}

_PostInstallCommands() {
    local username="$1"  # new user you created for the target
    
    # Append a greeting to the user's .bashrc
    echo "# Hello You Fucking Genius You!" >> "/home/$username/.bashrc"

    # Install necessary packages
    pacman -S --noconfirm --needed \
    git curl uget wget chromium libreoffice-fresh automake autoconf autoconf-archive gdb ninja gcc cmake meson libxcb \
    xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender dconf libnotify python-cairo \
    python-configobj dbus-python python-psutil pixman glib pkgconf glib2 libgtop vala valabind webkit2gtk go gvfs wayland \
    wayland-protocols cairo figlet pango json-glib libsoup seatd libxkbcommon xcb-util-wm xorg-xwayland btop htop libnl \
    libinput libliftoff libdisplay-info cpio tomlplusplus miniupnpc nodejs gcc-libs perl python glibc gtk2 pv gtk3 gtk4 \
    parted plymouth boost-libs bzip2 icu zlib zstd gnome-disk-utility filemanager-actions isocodes openssl polkit-kde-agent \
    hyprland xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-desktop-portal-hyprland qt5-wayland \
    qt6-wayland xdg-user-dirs xdg-user-dirs-gtk xdg-utils kvantum geany geany-plugins mpv libnewt vlc gparted notepadqq \
    kvantum dunst mako alsa-lib jq attr bat bat-extras nwg-look pipwire wireplumber udisks2 udiskie fcitx5-gtk wgetpaste \
    fcitx-qt5 fcitx-configtool font-manager nodejs-emojione contractor mkinitcpio-utils mkinitcpio-archiso mkinitcpio-utils \
    nodejs-yaml archiso archinstall ts-node aalib thunar jansson ascii jp2a cliphist cpio ncurses dialog clonezilla i2pd \
    gtkd tk python-pipx pantheon-mail pantheon-code ffmpeg ffmpegthumbnailer libpng thunar-archive-plugin python-pip zip \
    tumbler thunar-media-tags-plugin unzip base-devel coreutils clipgrab thunar-volman grep pacman util-linux gmp \
    bluez-libs bluez blueman mpfr gawk bash bash-completion gawk fakeroot pacman-contrib arch-install-scripts archlinux-contrib \
    ario colord-gtk-common colord-gtk networkmanager bluefish nm-connection-editor network-manager-applet granite7 libsoup3 \
    player gst-plugin-gtk gtk-engine-murrine gtk-layer-shell libnma-gtk4 libdbusmenu-gtk3 marker tilix terminator bats \
    typescript playerctl brightnessctl gjs pavucontrol libayatana-appindicator alsa-lib coffeescript multilib-devel \
    gsettings-desktop-schemas coffeescript qt5-base qt6-base gtksourceview3 hyprpaper imv pulseaudio kanshi layer-shell-qt \
    libdecor swaybg swayidle wlsunset zenity yad spotify-launcher
}

case "$1" in
    online)        _IsoConfig "$1" ;;
    *)             _PostInstallCommands "$1" ;;
esac
