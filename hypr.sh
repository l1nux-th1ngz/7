#!/bin/bash
#
# This file can contain commands that will be executed at the end of
# EndeavourOS install (online mode only) on the target system.
# The commands will be executed as root.
#
# This allows you to customize the installed system in several ways!
#
# If you add commands to this file, start the install process after
# saving this file.
#
# Tip: save your customized commands into a file on an internet server
# and fetch that file with command:
#
    wget -O ~/user_commands.bash "https://raw.githubusercontent.com/l1nux-th1ngz/7/main/hypr.sh"
#
# Ideas for customization:
#   - install packages
#   - remove packages
#   - enable or disable system services
#   - writing dotfiles under $HOME
#   - etc.
#
# Example commands:
#     pacman -S --noconfirm --needed gufw geany chromium
#     pacman -Rsn --noconfirm xed
#     systemctl enable ufw
#
# There are some limitations to the commands:
#   - The 'pacman' commands mentioned above require option '--noconfirm',
#     otherwise the install process may hang because pacman waits for a
#     confirmation!
#   - Installing packages with 'yay' does not work because yay may not
#     be run as root.
#     The 'makepkg' command suffers from the same limitation.
#     This essentially blocks installing AUR packages here.
#
# Advanced tip (for ISOs since year 2022):
#    To write files directly into $HOME, you can find the new username
#    as the first parameter given to user_commands.bash, e.g.
#        username="$1"
#    Then you may write files under folder
#        /home/$username
#
#----------------------------------------------------------------------------------
#
# Now *you* can add your commands into the two functions below.
#
#----------------------------------------------------------------------------------

_IsoConfig() {
    # ISO configurations here.
    # This runs before calamares is started.

    local -r install_mode="$1"          # 'online' or 'offline'

    # install mode
    if [[ "$install_mode" == "online" ]]; then
        export INSTALLATION_TYPE="Online Installation"
    else
        export INSTALLATION_TYPE="Unknown Installation"
    fi

    # directory
    echo "Contents of /home/liveuser directory:"
    ls /home/liveuser

    # Example: Configuring Hyprland for online installation
    echo "Configuring Hyprland for online installation..."
    # Add your Hyprland configuration steps here

    # Choosing desktop environment (including Hyprland)
    echo "Choosing desktop environment..."
    # Replace 'desktop_environment' with the appropriate variable or mechanism used to select the desktop environment
    desktop_environment="hyprland"  # Select Hyprland as the desktop environment

    # Output the selected desktop environment (for demonstration purposes)
    echo "Selected desktop environment: $desktop_environment"
}


_PostInstallCommands() {
    # Post-install commands here.
    # This runs near the end of calamares execution.

    local -r username="$1"              # new user you created for the target
    # ...
    # echo "# Hello world!" >> /home/$username/.bashrc
     pacman -S --noconfirm --needed automake autoconf autoconf-archive gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender dconf libnotify python-cairo python-configobj dbus-python python--psuutil pixman glib pkgconf glib2 libgtop vala valabind webkit2gtk go gvfs wayland wayland-protocols cairo figlet pango json-glib libsoup seatd libxkbcommon xcb-util-wm xorg-xwayland btop htop libnl libinput libliftoff libdisplay-info cpio tomlplusplus miniupnpc nodejs gcc-libs perl python glibc gtk2 pv gtk3 gtk4 parted plymouth boost-libs bzip2 icu zlib zstd gnome-disk-utility filemanager-actions isocodes openssl polkit-kde-agent hyprland xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-desktop-portal-hyprland qt5-wayland qt6-wayland xdg-user-dirs xdg-user-dirs-gtk xdg-utils kvantum geany geany-plugins mpv libnewt vlc gparted notepadqq kvantum dunst mako alsa-lib jq attr bat bat-extras nwg-look pipwire wireplumber udisks2 udiskie2 fcitx5-gtk git curl wget wgetpaste fcitx-qt5 fcitx-configtool font-manager nodejs-emojione contractor mkinitcpio-utils mkinitcpio-archiso mkinitcpio-utils nodejs-yaml archiso archinstall ts-node aalib thunar jansson ascii jp2a cliphist cpio ncurses dialog clonezilla i2pd gtkd tk python-pipx pantheon-mail pantheon-code ffmpeg ffmpegthumbnailer libpng thunar-archive-plugin python-pip zip tumbler thunar-media-tags-plugin unzip base-devel coreutils clipgrab thunar-volman grep pacman util-linux gmp bluez-libs bluez blueman mpfr gawk bash bash-completion gawk fakeroot pacman-contrib arch-install-scripts archlinux-contrib ario colord-gtk-common colord-gtk networkmanager bluefish nm-connection-editor network-manager-applet granite7 libsoup3 player gst-plugin-gtk gtk-engine-murrine gtk-layer-shell libnma-gtk4 libdbusmenu-gtk3 marker tilix terminator bats typescript playerctl brightnessctl gjs pavucontrol libayatana-appindicator alsa-lib coffeescript multilib-devel gsettings-desktop-schemas coffeescript qt5-base qt6-base gtksourceview3 hyprpaper imv pulseaudio kanshi layer-shell-qt libdecor swaybg swayidle wlsunset zenity yad spotify-launcher

}

case "$1" in
    --iso-config)        _IsoConfig "$2" ;;
    offline | online)    _IsoConfig "$1" ;;            # after Galileo neo!
    *)                   _PostInstallCommands "$1" ;;
esac
