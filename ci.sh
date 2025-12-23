#!/usr/bin/env bash
set -euo pipefail

echo "▶ Flake checks"
nix flake check

echo "▶ Build NixOS configurations"
for host in $(nix flake show --json | jq -r '.nixosConfigurations | keys[]'); do
  echo "  → $host"
  nix build ".#nixosConfigurations.${host}.config.system.build.toplevel"
done

echo "▶ Build Home Manager configurations"
for user in $(nix flake show --json | jq -r '.homeConfigurations | keys[]'); do
  echo "  → $user"
  nix build ".#homeConfigurations.${user}.activationPackage"
done

echo "✅ All checks passed"

