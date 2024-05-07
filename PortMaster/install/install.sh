#!/bin/bash

# Check if architecture is aarch64 (arm)
if [[ "$(uname -m)" != "aarch64" ]]; then
    echo "Error: Unsupported architecture. This installer only supports aarch64 (ARM64)."
    exit 1
fi

# Intro Message
echo "PortMaster Installer for Batocera"
echo "Initializing installation..."
sleep 5

# Download and extract PortMaster.zip to /userdata/roms/ports/Portmaster folder
mkdir -p /userdata/roms/ports/Portmaster
curl -L https://github.com/garbagescow/PortMaster-Batocera/raw/main/PortMaster/install/PortMaster.zip -o /tmp/PortMaster.zip
unzip -q /tmp/PortMaster.zip -d /userdata/roms/ports/PortMaster

# Make PortMaster.sh executable
chmod +x /userdata/roms/ports/Portmaster/PortMaster.sh

# Download custom.sh to /userdata/system and make it executable
curl -L https://github.com/garbagescow/PortMaster-Batocera/raw/main/PortMaster/install/custom.sh -o /userdata/system/custom.sh
chmod +x /userdata/system/custom.sh



echo "PortMaster installed successfully!"

# Dialog box for reboot confirmation
if dialog --yesno "PortMaster has been installed to PORTS and needs reboot. Would you like to reboot now?" 10 50; then
    shutdown -r now
fi
