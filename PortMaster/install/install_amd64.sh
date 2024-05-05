#!/bin/bash

# Check if architecture is aarch64 (arm)
if [[ "$(uname -m)" != "x86_64" ]]; then
    echo "Error: Unsupported architecture. This installer only supports x86_64 (AMD/INTEL)."
    exit 1
fi

# Intro animated PortMaster installer screen (replace with your animation)
echo "PortMaster Installer for Batocera"
echo "Initializing installation..."
sleep 5

# Download and extract PortMaster.zip to /userdata/roms/ports/Portmaster folder
mkdir -p /userdata/roms/ports/Portmaster
curl -L https://github.com/garbagescow/PortMaster-Batocera/raw/main/PortMaster/install/PortMaster.zip -o /tmp/PortMaster.zip
unzip -q /tmp/PortMaster.zip -d /userdata/roms/ports/PortMaster

# Make PortMaster.sh executable
chmod +x /userdata/roms/ports/Portmaster/PortMaster.sh

# Download custom.sh to /userdata/system/services and make it executable
mkdir -p /userdata/system/services
curl -L https://github.com/garbagescow/PortMaster-Batocera/raw/main/PortMaster/install/custom.sh -o /userdata/system/portmaster
chmod +x /userdata/system/services/portmaster



echo "PortMaster installed successfully!"
echo "Activate Portmaster Service in main menu -- System -- Services"
