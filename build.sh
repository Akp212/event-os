#!/bin/bash
# lxgames-build.sh -- creates an LXgames LiveCD ISO, based on lubuntu-build.sh
# Author: Thanh Nguyen <thanhnguyen@mbm.vn>
# Based heavily on HOWTO information by 
#   Julien Lavergne <gilir@ubuntu.com>
# Version: 20110303

set -eu				# Be strict

# Script parameters: arch mirror gnomelanguage release
# Arch to build ISO for, i386 or amd64
arch=${1:-amd64}
# Ubuntu mirror to use
mirror=${2:-"http://archive.ubuntu.com/ubuntu/"}
# Set of GNOME language packs to install.
#   Use '\*' for all langs, 'en' for English.
# Install language with the most popcon
gnomelanguage=${3:-'{en}'}	#


# Copy the source.list to enable universe / multiverse in the chroot, and eventually additional repos.
sudo cp -v event-metapackage_1.0_all.deb chroot

# Install event-os-metapackage
dpkg -i event-metapackage_*_all.deb
apt-get install -f


# Mount needed pseudo-filesystems
sudo mount --rbind /sys chroot/sys
sudo mount --rbind /dev chroot/dev
sudo mount -t proc none chroot/proc

# Work *inside* the chroot
sudo chroot chroot <<EOF
# Set up several useful shell variables
export CASPER_GENERATE_UUID=1
export HOME=/root
export TTY=unknown
export TERM=vt100
export DEBIAN_FRONTEND=noninteractive
export LANG=C
export LIVE_BOOT_SCRIPTS="casper lupin-casper"
