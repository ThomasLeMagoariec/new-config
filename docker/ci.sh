#!/usr/bin/env bash
set -euo pipefail

echo "▶ Enabling Cachix"
cachix use mycache


echo "▶ Flake checks"
nix flake check

echo "▶ Build NixOS configurations"
for host in $(nix flake show --json | jq -r '.nixosConfigurations | keys[]'); do
  echo "  → $host"
  nix build ".#nixosConfigurations.${host}.config.system.build.toplevel"
done

echo "▶ Build Home Manager configurations"
home-manager build --flake .#thomas

echo "✅ All checks passed"

