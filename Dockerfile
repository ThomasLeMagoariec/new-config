FROM nixos/nix:latest

# Git safety for mounted repo
RUN git config --global --add safe.directory /work

# Enable flakes + nix-command, disable sandbox
RUN mkdir -p /etc/nix && \
    echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf && \
    echo "sandbox = false" >> /etc/nix/nix.conf

# Runtime tools needed by ci.sh
RUN nix profile install \
    nixpkgs#jq \
    nixpkgs#cachix

WORKDIR /work

