#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1) Symlink top‑level files into your home directory:
for file in .zshrc .p10k.zsh; do
    target="$HOME/$file"
    [ -e "${target}" ] && mv "${target}" "${target}.bak"
    ln -s "${DOTFILES_DIR}/${file}" "${target}"
done

# 2) Ensure oh‑my‑zsh is installed:
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh…"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3) Link your custom oh‑my‑zsh plugins/themes:
mkdir -p "$HOME/.oh-my-zsh/custom"
ln -snf "${DOTFILES_DIR}/zsh/custom-plugins" "$HOME/.oh-my-zsh/custom/plugins"
ln -snf "${DOTFILES_DIR}/zsh/custom-themes" "$HOME/.oh-my-zsh/custom/themes"

echo "All done! Restart your shell."
