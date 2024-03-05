# iQiexie's dotfiles

## Install

Instructions on how to install Arch Linux are stored in `./readmes/macbookair_2015_install.md`

## Post Install

1. Install Yet Another Yourt `./postinstall_scripts/install_yay.sh`
2. Install the actual dotfiles `./postinstall_scripts/install_dotfiles.sh`
3. Install all the packages `yay -S - < pkglist.txt`

## Saving dotfiles

To save your current dotfiles just run `./scripts/dump_it.sh`. Be careful and maintain this file, if you want to add configurations for your extra apps

## Little onboarding guide

- Autostart apps are configured here: `./config/hypr/hyprland.conf`
- Hotkeys are configured here: `./config/hypr/hyprland.conf`
- Aliases are configured here: `~/.zshrc` in the `Aliases` section
