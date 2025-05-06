#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing dotfiles from $DOTFILES_DIR"
echo "This script will create symlinks for your dotfiles and install oh-my-zsh if not already installed."
echo "Make sure to review the script before running it."

# 1) Symlink top‑level files into your home directory:
for file in .zshrc .p10k.zsh .gitconfig .gitignore_global .bash_profile; do
    target="$HOME/$file"
    [ -e "${target}" ] && mv "${target}" "${target}.bak"
    ln -s "${DOTFILES_DIR}/${file}" "${target}"
done

# 2) Ensure oh‑my‑zsh is installed:
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh…"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# Initialize oh-my-zsh submodules:
git -C "$DOTFILES_DIR" submodule update --init --recursive

# 3) Link your custom oh‑my‑zsh plugins/themes:
mkdir -p "$HOME/.oh-my-zsh/custom"
ln -snf "${DOTFILES_DIR}/.oh-my-zsh/custom/plugins" "$HOME/.oh-my-zsh/custom/plugins"
ln -snf "${DOTFILES_DIR}/.oh-my-zsh/custom/themes" "$HOME/.oh-my-zsh/custom/themes"

echo "All done! Restart your shell."
