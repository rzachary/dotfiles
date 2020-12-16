# If you come from bash you will probably have to change the path for sure.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Directories to be prepended to $PATH
declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/local/share/"
  "/usr/bin"
  "/usr/local/sbin"
  "/usr/local/git/bin"
  "/usr/local/"
  "/usr/local/mysql/bin"
  "/sw/bin/"
  "$HOME/dotfiles/bin"
  "$HOME/bin"
  "$HOME/.rvm/bin"
  "$(brew --prefix ruby)/bin"
  "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
  "$(brew --prefix)/share/npm/bin" # Add npm-installed package bin
)

# Explicitly configured $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# To correct a potential issue with python3, it causes a problem with zsh
PATH=/usr/local/share/python:$PATH

export PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Z beats cd most of the time
# . ~/z/z.sh

# Set the zsh options

# Case-insentive globbing (used in pathname expansion) 
setopt NO_CASE_GLOB

# Append to the Bash history file, rather than overwriting it
setopt EXTENDED_HISTORY

# Explicitly set a history file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# Autocorrect typos in path names when using cd
setopt AUTO_CD

# https://apple.stackexchange.com/questions/381836/zsh-brew-and-oh-my-zsh-insecure-completion-dependent-directories-detected-as
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/Workspace/dotfiles/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# User configuration

# Load the shell dotfiles
for file in $HOME/.{shell_exports,shell_aliases,shell_functions,shell_config}; do
 [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Automatically list directory contents on `cd`.
# auto-ls () {
#   emulate -L zsh;
#   # explicit sexy ls'ing as aliases arent honored in here.
#   hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
# }
# chpwd_functions=( auto-ls $chpwd_functions )

source $ZSH/oh-my-zsh.sh

# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

# npm tab completion
# . <(npm completion)

# fortune: brew install fortune ponysay
# fortune | ponysay

# Adding in the sourcing for zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# hooks in all the alias, funtions and the like into the zshell, dope!
source ~/.bash_profile