# dotfiles

My personal Arch Linux dotfiles for a Hyprland setup with Tokyo Night theme.

## Stack

- WM: Hyprland
- Bar: Quickshell
- Terminal: Kitty + Maple Mono NF
- Editor: Neovim
- Shell: Bash
- Lock screen: Hyprlock
- Wallpaper: awww (started from the Hyprland config, wallpapers live in `hypr/wallpaper/`)

## Structure

This repo is organized by machine profile:

- `work-setup/` — configs for the work laptop
- `home-setup/` — configs for the home machine (WIP)

Each profile folder contains one package per program, managed with GNU Stow. Packages are flat: config files sit directly in the package folder, with no nested `.config/` inside the repo.

```
work-setup/
├── bash/         -> ~/
├── hypr/         -> ~/.config/hypr/
├── kitty/        -> ~/.config/kitty/
├── nvim/         -> ~/.config/nvim/
├── quickshell/   -> ~/.config/quickshell/
└── install.sh
```

## Install

```bash
git clone https://github.com/hro1025/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/work-setup
./install.sh
```

`install.sh` stows `bash` into `~` and every other package into `~/.config/<package>`, creating the target folders if they don't exist. It uses `stow -R`, so it's safe to rerun anytime, for example after adding new files to a package.

To stow a single package manually:

```bash
cd ~/.dotfiles/work-setup
mkdir -p ~/.config/kitty
stow -R -t ~/.config/kitty kitty
```

If Stow reports a conflict, a real file already exists at that location. Back it up or remove it, then run the script again.

## Verifying symlinks

List every link that points into this repo:

```bash
find ~ -maxdepth 3 -type l -lname '*dotfiles/work-setup*' -printf '%p -> %l\n'
```

Find broken links left behind by old layouts:

```bash
find ~ ~/.config -maxdepth 1 -xtype l
```
