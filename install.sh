#!/usr/bin/env bash
set -e

# Parse command line arguments
INSTALL_TMUX_PLUGINS=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --tmux-plugins)
            INSTALL_TMUX_PLUGINS=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--tmux-plugins] [--help]"
            echo "  --tmux-plugins    Install Tmux Plugin Manager and plugins"
            echo "  --help           Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done



DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing dotfiles from $DOTFILES_DIR"
echo "This script will create symlinks for your dotfiles and install oh-my-zsh if not already installed."
echo "Make sure to review the script before running it."



# 1) Ensure oh‑my‑zsh is installed (must run before step 3 creates ~/.oh-my-zsh/custom):
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "Installing oh-my-zsh…"
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi


# 2) Symlink top‑level files into your home directory:
for file in .zshrc .tmux.conf .p10k.zsh .gitignore_global .bash_profile; do
    target="$HOME/$file"
    # Already linked from a previous run: leave the original .bak alone
    [ "$(readlink "${target}")" = "${DOTFILES_DIR}/${file}" ] && continue
    if [ -e "${target}" ] || [ -L "${target}" ]; then
        mv "${target}" "${target}.bak"
    fi
    ln -s "${DOTFILES_DIR}/${file}" "${target}"
done


# Initialize oh-my-zsh submodules:
git -C "$DOTFILES_DIR" submodule update --init --recursive

# 3) Link your custom oh‑my‑zsh plugins/themes:
if [ -d "$HOME/.oh-my-zsh/custom" ]; then
    [ -e "$HOME/.oh-my-zsh/custom.bak" ] && rm -rf "$HOME/.oh-my-zsh/custom.bak"
    mv "$HOME/.oh-my-zsh/custom" "$HOME/.oh-my-zsh/custom.bak"
fi
mkdir -p "$HOME/.oh-my-zsh/custom"
ln -snf "${DOTFILES_DIR}/.oh-my-zsh/custom/plugins" "$HOME/.oh-my-zsh/custom/plugins"
ln -snf "${DOTFILES_DIR}/.oh-my-zsh/custom/themes" "$HOME/.oh-my-zsh/custom/themes"

# Install Tmux plugins only if flag is passed
if [ "$INSTALL_TMUX_PLUGINS" = true ]; then
    echo "Installing Tmux plugins..."

    # Install TPM (Tmux Plugin Manager) if not already installed
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        echo "Installing Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo "Tmux Plugin Manager already installed."
    fi

    # Install tmux plugins automatically
    if [ -d ~/.tmux/plugins/tpm ]; then
        echo "Installing tmux plugins..."
        ~/.tmux/plugins/tpm/bin/install_plugins
    fi
else
    echo "Skipping Tmux plugin installation. Use --tmux-plugins flag to install them."
fi

# Point git at the global ignore file
git config --global core.excludesfile "$HOME/.gitignore_global"

# set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

echo "All done! Restart your shell."
