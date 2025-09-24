#!/bin/bash

# Set non-interactive apt timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Install tmux and expect
apt-get update
apt-get install -y tmux expect

# Install tmux to get terminal
tmux new -d -s mysession bash

# Print SSH and RDP (example) session links
echo "SSH access:"
echo "ssh root@$(hostname -i) -p 22 (password: root)"
echo "RDP access (if enabled):"
echo "Use Remote Desktop to $(hostname -i)"

# Run tmux to keep it alive
while true
do
    tmux ls || tmux new -d -s mysession
    sleep 300
done
