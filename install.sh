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



# # 1) Ensure oh‑my‑zsh is installed:
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#     echo "Installing oh-my-zsh…"
#     sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended
# fi


# 2) Symlink top‑level files into your home directory:
for file in .zshrc .tmux.conf .p10k.zsh .gitignore_global .bash_profile; do
    target="$HOME/$file"
    [ -e "${target}" ] && mv "${target}" "${target}.bak"
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

echo "All done! Restart your shell."

# set zsh as default shell
chsh -s $(which zsh)
