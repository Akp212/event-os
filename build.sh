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