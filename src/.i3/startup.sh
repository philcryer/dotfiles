#!/bin/sh

# sourced from https://gitorious.org/fmarier-misc-scripts/user-scripts/source/79a213ec1cbe090fd25ebcad58349ddb30500ced:startup
# details and tips http://feeding.cloud.geek.nz/posts/creating-a-modern-tiling-desktop-environment-using-i3/


# Needed by workrave
#mkdir -p /dev/shm/workrave-francois

# Desktop environment
#gnome-settings-daemon &
gnome-keyring-daemon
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
gnome-screensaver &
#nm-applet &
xautolock -time 30 -locker "gnome-screensaver-command --lock" &
#git annex assistant --autostart
#i3-battery-indicator &
xset dpms 1800 3600 3630

# Vacuuming SQLite databases
find $HOME/.mozilla/ \( -name "*.sqlite" \) -execdir sqlite3 {} "vacuum" \;

# Cleanup unnecessary files
rm -rf $HOME/.cache/chromium
rm -rf $HOME/.thumbnails
rm -rf $HOME/.local/share/Trash

# Graphical programs
#emacs --daemon
#ionice -n7 akregator &
