#!/bin/bash
# Utility for HamoniKR Desktop Linux (HamoniKR)
# Copyright (C) 2015-2019 HamoniKR Team, Kevin Kim <root@hamonikr.org>
#
# This file may be used under the terms of the GNU General Public License, version 2 or later.
# For more details see: https://www.gnu.org/licenses/gpl-2.0.html

Text='\033[1;32m'
NC='\033[0m'

if ((${EUID:-0} || "$(id -u)")); then
  clear
  sleep 1.5
  	echo -e "${NC}Sorry, You are not root"
  sleep 1.0
  	echo "Please run using sudo command"
  sleep 1.0
  	echo -e "${Text}Cancelling Installation Command"
  sleep 1.5
  exit 1
else
  clear
  sleep 1.5
  	echo -e "${Text}Please Wait Until Installing Complete"
  sleep 1.5
  	echo -e "${NC}Copying All HamoniKR Plymouth file"
	if [ -d "/usr/share/plymouth/themes/hamonikr-sun-logo" ]; then
		rm -rf /usr/share/plymouth/themes/hamonikr-sun-logo
	fi			
  	cp -iRv usr/share/plymouth/themes/hamonikr-sun-logo /usr/share/plymouth/themes/
  sleep 1.5
  clear
  	echo -e "${Text}Please Wait Until Installing Complete"
  	echo -e "${NC}Configuring All HamoniKR Plymouth"
  sleep 1.5
  	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/hamonikr-sun-logo/hamonikr-sun-logo.plymouth 50
  	
  	echo -e "${Text}All HamoniKR SUN Plymouth Theme Configured"
  sleep 1.5
  clear
  	echo "Select Number of Plymouth Theme"
  sleep 1.0
    echo -e "${NC} "
  	update-alternatives --config default.plymouth
  	update-initramfs -u
  sleep 0.5
  	echo "Finish"
  	echo "Type below command, if you want to see"
  	echo "sudo ./preview.sh"
fi
