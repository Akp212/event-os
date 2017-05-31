#!/bin/bash

# Install base packages
apt-get -q -y --purge install --no-install-recommends \
  cinnamon-desktop-environment vlc

# Archive Manager
apt-get -q -y --purge install file-roller unrar

# lubuntu-restricted-extras
apt-get -q -y --purge install lubuntu-restricted-extras

# Install specific packages
apt-get -q -y -o Dpkg::Options::="--force-overwrite" --purge install chromium-browser

#rm -rf /etc/chromium-browser
mv /etc/chromium-browser_ /etc/chromium-browser

# Install Internet packages
apt-get -q -y --purge install flashplugin-installer google-talkplugin

# Install graphic
apt-get -q -y --purge install inkscape