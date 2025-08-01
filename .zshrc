# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# PROMPT='%2~ %n@%m %# '

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'a
## * Configuration for fzf-tab
# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# zstyle ':completion:*' menu no
# # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# # custom fzf flags
# # NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# # To make fzf-tab follow FZF_DEFAULT_OPTS.
# # NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes
# # switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf 
    fzf-tab
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    # z
    extract
    # sudo
    python 
    pip
    conda
    conda-env
    pipenv
    autopep8
    npm
    yarn
    docker-compose
    kubectl
    kubectx
    pylint
    aws
    # brew # Brew aliases 
    golang
    docker 
    node
    nvm
    bun 
    gh
    terraform
    ssh # Auto completion for ssh
    history # for history search
    colorize # for colorizing output
    colored-man-pages 
    command-not-found  # for command-not-found plugin
    arduino-cli
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias orbit-list-android-devices="/Applications/Expo\ Orbit.app/Contents/Resources/orbit-cli-arm64 list-devices -p android"
alias orbit-list-ios-devices="/Applications/Expo\ Orbit.app/Contents/Resources/orbit-cli-arm64 list-devices -p ios"
alias orbit-launch="/Applications/Expo\ Orbit.app/Contents/Resources/orbit-cli-arm64 install-and-launch"
# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)

# # Command Not Found Handler
# HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
# if [ -f "$HB_CNF_HANDLER" ]; then
# source "$HB_CNF_HANDLER";
# fi

ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="colorful"


# setopt PROMPT_SUBST
# PROMPT='%2~ '
# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/kevin/.bun/_bun" ] && source "/Users/kevin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# For suggestions - zsh-autosuggestions
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8a8a"  # Change suggestion color
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # Use both history and completion
# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=1000000  # Limit size for performance

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
# export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin"


# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# # Set Oh My Zsh theme conditionally
# if [[ "$TERM_PROGRAM" == "vscode" ]]; then
#   ZSH_THEME=""  # Disable Powerlevel10k for Cursor
#   PROMPT='%n: %~%# '
#   RPROMPT=''
# else
#   ZSH_THEME="powerlevel10k/powerlevel10k"
# fi


# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh
