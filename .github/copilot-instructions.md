# This project is made to make my own custom dotfiles project. Where I store all my configuration files 

I use oh-my-zsh,  p10k, brew and MacBook m2 pro.

    ~/Repositories/dotfiles  on   main !1 ?4   base  at  18:30:30 
❯ tree -L 4 -a -I "node_modules|.expo|.git"
.
├── .DS_Store
├── .github
│   └── copilot-instructions.md
├── .gitignore
├── .oh-my-zsh
│   ├── .DS_Store
│   └── custom
│       ├── plugins
│       │   ├── example
│       │   ├── fzf-tab
│       │   ├── z
│       │   ├── zsh-autosuggestions
│       │   ├── zsh-completions
│       │   └── zsh-syntax-highlighting
│       └── themes
│           ├── example.zsh-theme
│           └── powerlevel10k
├── .p10k.zsh
├── .zshrc
└── install.sh

13 directories, 8 files



cd ~/Repositories
git clone git@github.com:<you>/dotfiles.git
cd dotfiles
./install.sh

This will:
	1.	Back up any existing ~/.zshrc/.p10k.zsh.
	2.	Symlink your tracked versions.
	3.	Install oh‑my‑zsh if missing.
	4.	Wire up your custom plugins/themes.

After that, whenever you update something:

# in ~/Repositories/dotfiles
git pull
./install.sh    # re‑symlinks/updates if needed
