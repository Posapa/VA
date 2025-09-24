#!/bin/bash

# Set non-interactive timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Install tmux and expect
apt-get update
apt-get install -y tmux expect

# Start tmux in background
tmux new -d -s mysession bash

# Print connection info
echo "========================================="
echo " SSH access:"
echo "   ssh root@$(hostname -i) -p 22 (password: root)"
echo "========================================="
echo " RDP access (if enabled):"
echo "   Use Remote Desktop to $(hostname -i)"
echo "========================================="

# Keep container alive by ensuring tmux stays running
while true
do
    tmux ls || tmux new -d -s mysession
    sleep 300
done
