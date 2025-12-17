#!/bin/bash

# --- Core System Setup ---
echo "Installing core system utilities and development tools..."
sudo pacman -S --needed base-devel git unzip

# --- Graphics Drivers & Wayland Integration ---
echo "Installing Nvidia drivers and Wayland desktop integration components..."
sudo pacman -S --needed nvidia-utils nvidia-dkms nvidia-settings egl-wayland libva mesa-utils libva-nvidia-driver
sudo pacman -S --needed xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# --- Fonts ---
echo "Installing fonts..."
sudo pacman -S --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-font-awesome
paru -S gnu-free-fonts ttf-joypixels noto-fonts-cjk

# --- Desktop Environment & WM Components ---
echo "Installing Hyprland utilities and Wayland-specific tools..."
sudo pacman -S --needed hyprlock hyprpicker waybar cliphist

# --- Essential Applications ---
echo "Installing core user applications..."
sudo pacman -S --needed neovim ripgrep thunar lazygit rofi-wayland thunderbird spotify-launcher imv mpv krita
sudo pacman -D --asexplicit mpv
paru -S zen-browser-bin wezterm-git vesktop visual-studio-code-bin

# --- Peripherals & Hardware Utilities ---
echo "Installing utilities for Bluetooth, RGB, etc..."
sudo pacman -S --needed bluez bluez-utils blueman openrgb
sudo systemctl enable --now bluetooth

# --- System Utilities & Daemons ---
echo "Installing general system utilities and services..."
sudo pacman -S --needed gvfs github-cli jq gnome-keyring polkit-gnome brightnessctl

# --- Theming ---
echo "Installing theming tools and themes..."
sudo pacman -S --needed nwg-look
paru -S catppuccin-gtk-theme-macchiato

# --- Shell Setup ---
echo "Setting up Zsh and Oh My Zsh..."
sudo pacman -S --needed zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- Cleanup / Removals ---
echo "Removing unwanted default packages..."
sudo pacman -Rns kitty dolphin wofi
