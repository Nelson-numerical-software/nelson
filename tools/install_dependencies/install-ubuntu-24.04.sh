#!/bin/bash
#
# Nelson - Installation script for Ubuntu 24.04 dependencies
# This script installs all required dependencies to build Nelson from source
#

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Return value of a pipeline is the value of the last command

# Function to print messages
print_status() {
    echo -e "\n===> $1"
}

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo privileges."
    exit 1
fi

print_status "Nelson - Installation script for Ubuntu 24.04 dependencies"

if [ "$GITHUB_ACTIONS" = "true" ]; then
    # Remove existing Firefox installation (temporary workaround, CI issue)
    print_status "Removing existing Firefox installation"
    snap remove firefox || true  # Ignore errors if Firefox is not installed via snap
    apt-get remove --purge -y firefox || true
fi

print_status "Updating package lists"
apt-get update --fix-missing -y

print_status "Upgrading existing packages"
apt-get upgrade -y

# Just 1.33 or higher is required
print_status "Installing Just"
snap install --classic just

print_status "Installing build tools"
apt-get install -y build-essential ninja-build autotools-dev libtool automake \
                   pkg-config gettext

print_status "Installing system dependencies"
apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common wget \
                   xvfb zlib1g-dev libffi-dev libicu-dev libxml2-dev libsqlite3-dev \
                   libgl-dev libcurl4-openssl-dev libgit2-dev libtbb-dev

print_status "Installing math libraries"
apt-get install -y libopenblas-openmp-dev liblapack-dev liblapacke-dev libfftw3-dev \
                   libeigen3-dev

print_status "Installing HDF5 and MATIO libraries"
apt-get install -y hdf5-tools libhdf5-dev libmatio-dev

print_status "Installing audio libraries"
apt-get install -y libasound-dev portaudio19-dev libsndfile1-dev libtag1-dev alsa-utils

print_status "Installing image libraries"
apt-get install -y libgif-dev libtiff-dev

print_status "Installing MPI libraries"
apt-get install -y libopenmpi-dev openmpi-bin

print_status "Installing Boost libraries"
apt-get install -y libboost-all-dev

print_status "Installing Qt6 dependencies"
apt-get install -y qt6-base-dev libqt6svg6-dev qt6-declarative-dev qt6-documentation-tools \
                   qt6-tools-dev \
                   qml6-module-qtquick qml6-module-qtquick-templates qml6-module-qtquick-controls \
                   qml6-module-qtquick-window qml6-module-qtquick-dialogs \
                   qml6-module-qtqml-workerscript qml6-module-qtquick-layouts

print_status "Installing Python dependencies"
apt-get install -y python3 python3-numpy

print_status "Cleaning up"
apt-get autoremove -y
apt-get clean

print_status "All dependencies have been installed successfully!"
