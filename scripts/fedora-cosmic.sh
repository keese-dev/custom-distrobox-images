#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf update -y

# extra repos
dnf copr enable atim/starship

sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

# Update the container and install packages again
dnf update -y
grep -v '^#' ./fedora-cosmic.packages | xargs dnf install -y
