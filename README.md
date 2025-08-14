# nix & home-manager
This guide demonstrates how to get nix installed and using home-manager to manage basic programs & packages. It is intentionally simple.

## Install nix
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```

## Create home-manager directory
```bash
mkdir -p ~/.config/home-manager
```

## Initialize flake
```bash
cd ~/.config/home-manager
nix flake init
```

## Instructions
Replace the initialized nix with the code found in flake.nix. The gist flake.nix also references 4 other files (programs.nix, packages.nix, config.nix, and our zshrc template.

Additionally, we need to copy config.example.nix and replace the values with our system architecture, username, and home directory. This file is specific to your environment, so it should not be checked in.
