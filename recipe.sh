#!/bin/bash
set -oue pipefail

echo "Applying Ryzen 5 5600 + RTX 2060 Gaming Optimizations..."

# 1. Increase memory map count for Proton/Wine gaming stability
cat <<EOF > /etc/sysctl.d/99-gaming-performance.conf
vm.max_map_count=2147483642
fs.file-max=5242880
EOF

# 2. Configure NVIDIA Wayland & Gamescope compatibility flags
cat <<EOF > /etc/environment
GBM_BACKEND=nvidia-drm
__GLX_VENDOR_LIBRARY_NAME=nvidia
ENABLE_VIRTUAL_DISPLAY=1
EOF

# 3. Ensure essential gaming utilities are pre-installed
rpm-ostree install -y \
  mangohud \
  gamemode \
  steam \
  goverlay
