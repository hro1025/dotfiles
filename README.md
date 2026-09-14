# dotfiles

My personal Arch Linux dotfiles for a Hyprland setup with Tokyo Night theme.

## Stack

- WM: Hyprland
- Bar: Quickshell
- Terminal: Kitty + Maple Mono NF
- Editor: Neovim
- Notifications: Mako
- Wallpaper: Wpaperd
- Lock screen: Hyprlock
- Fastfetch: Fastfetch

## Structure

This repo is organized by machine profile:

- `work-setup/` — configs for the work laptop
- `home-setup/` — configs for the home machine (WIP)

Each profile folder contains one package per program, managed with GNU Stow.

## Install

```bash
git clone https://github.com/hro1025/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Then stow each package. **Note:** targets differ per package depending on its internal layout — some packages nest a `.config/` folder inside themselves, others don't.

```bash
# Packages that nest .config/ internally — target home (~)
stow -d work-setup -t ~ hypr kitty mako quickshell wpaperd bash

# nvim is flat (no nested .config/) — target ~/.config/nvim directly
mkdir -p ~/.config/nvim
stow -d work-setup -t ~/.config/nvim nvim
```

To re-stow after adding new files to a package (e.g. nvim):

```bash
cd ~/.dotfiles
stow -R -t ~/.config/nvim work-setup/nvim
```

## Verifying symlinks

Check that a package landed correctly (should show `->` pointing into `~/.dotfiles/work-setup/...`):

```bash
ls -la ~/.config/hypr
ls -la ~/.config/nvim
```

If `stow` reports no errors but the symlink is missing, double-check you're using the right `-t` target for that package — see Install above.

## Note

These configs were built with the help of AI (Claude by Anthropic). The setup, decisions, and customization are my own; AI was used as a tool to speed up the process.
