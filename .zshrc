# completion path
fpath=($HOME/.zfunc $fpath)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wapi"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle :omz:plugins:ssh-agent identities ~/.ssh/id_ed25519

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

plugins=(tmux git zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting ssh-agent)


#auto start tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME="Wapi"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi


alias lazy="cd ~/.config/nvim"
alias nvchad="cd ~/.config/nvim/lua/custom/"
alias mongostop="sudo systemctl stop mongod"
alias mongostart="sudo systemctl start mongod"
alias mysqlstart="sudo service mysql start"
alias mysqlstop="sudo service mysql stop"

# global aliases
alias -g v=nvim
alias -g c=clear

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# rofi scripts
export PATH=$HOME/.config/rofi/scripts:$PATH

# Volta javascript/node js package manager
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
