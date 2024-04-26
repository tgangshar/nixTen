#!/usr/bin/env bash
echo 'Updating Default Flakes: Overwriting everything'
sudo cp /etc/nixos/flake.lock .,/flake.lock 
sudo cp /etc/nixos/flake.nix ../flake.nix
sudo cp -r /etc/nixos/hosts ../hosts
# to do: change sudo permissions
