#!/bin/bash

# Run the Nix Installer with root
curl -L https://nixos.org/nix/install | sh -s -- --daemon

# Enable Nix Daemon:
systemctl enable nix-daemon.service
systemctl start nix-daemon.service

# Ensure the environment is configured:
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
