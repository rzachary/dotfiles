#!/usr/bin/env bash

###############################################################################
# Zsh                                                                         #
###############################################################################

# Install Zsh settings
ln -s ~/Workspace/dotfiles/zsh/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/themes
ln -s ~/Workspace/dotfiles/zsh/themes/nick.zsh-theme $HOME/.oh-my-zsh/themes

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Install the Solarized Dark theme for iTerm
open "${HOME}/Workspace/dotfiles/iterm/themes/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Reload zsh settings
source ~/.zshrc