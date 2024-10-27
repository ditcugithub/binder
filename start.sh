#!/bin/bash

# Install necessary packages
apt-get update
apt-get install -y lxde x11vnc websockify

# Set a password for VNC
echo "haidanh912" | x11vnc -storepasswd -f /etc/x11vnc.pass

# Start the VNC server
x11vnc -display :0 -usepw -forever -loop -noxdamage -repeat &

# Start a lightweight desktop environment
startlxde &

# Start noVNC
websockify --web /usr/share/novnc/ 6080 localhost:5900 &

# Output the web link for noVNC
echo "Access your desktop environment at: https://$(hostname).yourbinder.org/v2/gh/$(basename $(git rev-parse --show-toplevel))/$(git rev-parse --abbrev-ref HEAD)/?urlpath=vnc.html"
