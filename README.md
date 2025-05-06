# Kevin's Dotfiles

![Kevin D. Lopez](https://avatars.githubusercontent.com/u/kevindlopez?s=120)

## What is this project?

This repository contains my personal dotfiles and configuration for macOS, including setup for [Oh My Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k), custom plugins, and other tools I use on my set up. It helps me quickly bootstrap a new development environment and keep my settings in sync across machines.

## Features

- Zsh configuration with Oh My Zsh and custom plugins:
- Powerlevel10k theme with custom settings
- Homebrew package management
- Easy backup and restore of `.zshrc` and `.p10k.zsh`
- Automated install script

## Installation

1. Clone the repository:

```sh
git clone --recurse-submodules git@github.com:kevindlopez/dotfiles.git
cd dotfiles 
```

2. Install the script 
```sh 
git pull && git submodule update --remote --recursive
chmod +x install.sh
./install.sh
```
