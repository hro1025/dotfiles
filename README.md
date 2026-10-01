# dotfiles

My Arch Linux + Hyprland dotfiles, managed with GNU Stow.

## Stack

Hyprland, Quickshell, Alacritty, Neovim, Bash, Hyprlock, awww (wallpaper).

## Layout

```
work-setup/
├── alacritty/    -> ~/.config/alacritty/
├── bash/         -> ~/
├── hypr/         -> ~/.config/hypr/
├── nvim/         -> ~/.config/nvim/
├── quickshell/   -> ~/.config/quickshell/
└── install.sh
```

`home-setup/` is coming later.

## Install

```bash
git clone https://github.com/hro1025/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/work-setup
./install.sh
```
