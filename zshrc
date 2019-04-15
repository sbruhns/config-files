# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/home/stefa/bin:$PATH"


PATH="~/bin/:$PATH"
PATH="$(yarn global bin):$PATH"
PATH="~/.local/bin/:$PATH"
export PATH
# User specific aliases and functions
export PATH="$HOME/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export AWS_CREDENTIALS_PATH=$HOME/.phrase/config.json

# Path to your oh-my-zsh installation.
  export ZSH=/home/stefan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
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
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias ls="ls --color=auto"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code
PATH="$GOPATH/bin:$PATH"

function phrase-dev {
   eval $(script/docker-compose-env --rails-env development)
 }


 function phrase-test {
   script/docker-compose-env --rails-env test > env.sh
 }

 function phrase-index {
  bundle exec rake db:setup elasticsearch:initial_setup
 }

# eval $(keychain --agents gpg --eval)

export PHRASE_REPOS=$GOPATH/src/github.com/phrase
export DYNPORT_REPOS=$GOPATH/src/github.com/dynport
export SBRUHNS_REPOS=$GOPATH/src/github.com/sbruhns
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
export FORCE_INLINE_PROCESSING=1
export KUBERNETES_PROVIDER=vagrant

alias be="bundle exec"
alias rspec="bundle exec rspec"
alias rake="bundle exec rake"

alias k='kubectl'
alias gti='git'

export AWS_CREDENTIALS_PATH=$HOME/.phrase/config.json
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1
export KOPS_STATE_STORE=s3://phraseapp-kops
export KOPS_PROD_NAME=prod.k8s-kops.phraseapp.io
export BUILD_TOKEN="eel5ohmool0xaeyooheeLeeshaiD5ahkei8Fu1EiN2yahngeiV9ieloo1ohpiepe"

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

zle -N zle-line-init
# zle -N zle-keymap-select
export KEYTIMEOUT=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
