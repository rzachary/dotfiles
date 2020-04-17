# Rickey Zachary's Dotfiles

I have a particular way of setting my shell and terminal up so that I can be comfortable. I use a lot of different machines thorughout the day and am not very productive if I don't have my certain settings, configurations, and functions correctly set up. So for MacOS X to make sure I have all the tools and configs I need from the start I created a set of dotfiles to make my configuration scriptable and repeatable.


## Installation

I generally need a quick way of installing these configuraitons and may or may not have access to the internet (In the past I have worked on quite a few disconnected networks). In the cases in which I don't have the internet these files can be copied quickly to a shared drive, or some media device. However most of the time I am connected and can use git/github to assist in the installation, or get the dotfiles down to my ne machine.

### Using Git and the bootstrap script

I generally clone my repositories to a workspace folder, in fact it is the first thing I do when I am on a new machine. Something like:

```bash
mkdir $HOME/Workspace
```

This means that I have a nice place to put all of my repositories and other work related materials, so I might clone my dotfiles here as well:

`~/Workspace/dotfiles`, and then create `~/dotfiles` as a symlink.


To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

### Specify the `$PATH`, because it might not be right since I do my own thing

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom configurations and functions without doing anything special

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="RICKEY ZACHARY"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="rzachary@rickeyzachary.com
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

I actually run a number of Git/GitHub/GitLab accounts so I generally set these in teh global configuraiton file and use SSH keys to connect to the numerous Git repositories that I maintain and contribute to


### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

I mostly use MacOSX so when I am setting things up and installing my setup, I normally use [Homebrew](https://brew.sh/) to automate the install, I have a file that has all the formulae for the install (after installing Homebrew, off the top):

```bash
./brew.sh
```

## Author

| [![twitter/zachary_rickey](](http://twitter.com/zachary_rickey "You should follow me on twitter @zachary_rickey") |
| ----------------------------------------------------------------------------------------------------------------- |
| [Rickey Zachary](https://rickeyzachary.com)                                                                       |

## A few references where I pulled things from

* [Daniel Show](https://github.com/Danielshow/BoxSetting)

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), I borrowed my base configuration from him and made a ton of tweaks. If you want a more vanilla, non language specific set of dotfiles, especially in Vim I would start from here.

* [Jeremy Johnson](https://github.com/j1z0/vim-config), Vim Config, but specifically the python stuff. I write a lot of python code so I need VIM to be streamlined for some things

